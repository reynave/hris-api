<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Reimbursement extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
             echo $this->model->error("Error auth");
            exit;
        }
    }


    function index()
    {
        $data = array(
            "personalId" => $this->model->userId(),
            "data" =>$this->model->sql("SELECT r.*, p.name , n.name  AS 'reimbursement',
            CONCAT('Rp ', FORMAT(r.requestAmount, 0)) AS 'price'
            from reimbursement as r
            JOIN personal AS p ON p.id = r.personalId
            JOIN reimbursement_name AS n ON n.id = r.reimbursementNameId
            where r.presence = 1 and r.approved = 0 and r.personalId =  '".$this->model->userId()."' "),
        );
        echo json_encode($data);
    }

    function approvedLineList()
    {
        $personalId = $this->model->userId(); 
        $data = array(
            "personalId" => $personalId, 
            "data" =>$this->model->sql("SELECT r.*, p.name , n.name  AS 'reimbursement',
            CONCAT('Rp ', FORMAT(r.requestAmount, 0)) AS 'price', e.approvalLineId
            from reimbursement as r
            JOIN personal AS p ON p.id = r.personalId
            LEFT JOIN employment AS e ON e.personalId = p.id
            JOIN reimbursement_name AS n ON n.id = r.reimbursementNameId
            WHERE r.presence = 1 And r.approved = 0 AND e.approvalLineId = '".$this->model->userId()."' "),
        );
        echo json_encode($data);
    }

    function history()
    {
        $data = array(
            "data" =>$this->model->sql("SELECT r.*, p.name , n.name  AS 'reimbursement',
            CONCAT('Rp ', FORMAT(r.paidAmount, 0)) AS 'paid'
            from reimbursement as r
            JOIN personal AS p ON p.id = r.personalId
            JOIN reimbursement_name AS n ON n.id = r.reimbursementNameId
            where r.presence = 1   and r.personalId =  '".$this->model->userId()."' "),
        );
        echo json_encode($data);
    }
 
    function add()
    {
        $data = array(
            "personal" => $this->model->sql("SELECT id, name from personal where presence = 1 and id = '".$this->model->userId()."' order by name ASC"), 
            "reimbursementName" => $this->model->sql("SELECT id, name from reimbursement_name where presence = 1 order by name ASC"),  
            "today" => array(
                "year" => (int)date("Y"),
                "month" => (int)date("m"),
                "day" => (int)date("d"),
            ),
        );
        echo json_encode($data);
    }

    function update()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;

            $id = $post['id'];
            $update = array(
                "reimbursementNameId" => $post['model']['reimbursementNameId'],  
                "requestAmount" => $post['model']['requestAmount'],  
                "description" => $post['model']['description'],  
                "paidAmount" => $post['model']['paidAmount'],  
                "requestDate" => $post['model']['requestDate']['year']."-".$post['model']['requestDate']['month']."-".$post['model']['requestDate']['day'],  
                
                "updateDate"    => date("Y-m-d H:i:s"), 
                
            );
            $this->db->update('reimbursement', $update, "id='$id'");


            if($post['model']['approved']  > 0){
                $update = array(
                    "approved" => $post['model']['approved'],
                    "approvedDate" => date("Y-m-d H:i:s"),
                    "approvedBy" => $this->model->userId(),
                    
                );
                $this->db->update('reimbursement', $update, "id='$id'"); 
            }
          
            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

    function detail($id)
    {
        $data = array( 
            "reimbursementName" => $this->model->sql("SELECT id, name from reimbursement_name where presence = 1 order by name ASC"),  
          
            "item" => $this->model->sql("SELECT r.*, p.name , n.name  AS 'reimbursement'
                from reimbursement as r
                JOIN personal AS p ON p.id = r.personalId
                JOIN reimbursement_name AS n ON n.id = r.reimbursementNameId
                where r.id = '$id' ")[0],
        );
        echo json_encode($data);
    }



    function insert()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $item = $post['item'];
            $upload_data = $post['upload_data'];
            
            $id = $this->model->number('reimbursement');
            $insert = array(
                "id" => $id, 
                "requestDate" => $item['requestDate']['year'] . "-" . $item['requestDate']['month'] . "-" . $item['requestDate']['day'],
                "reimbursementNameId" => $item['reimbursementNameId'],
                "requestAmount" => $item['requestAmount'],
                "description" => $item['description'],
                "personalId" => $item['personalId'],  
                "uploadFile" => $upload_data['file_name'],  
                
                "inputDate"     => date("Y-m-d H:i:s"), 
            );
            $this->db->insert('reimbursement', $insert);

            $data = array( 
                "insert" => $this->model->sql("SELECT r.*, p.name , n.name  AS 'reimbursement'
                from reimbursement as r
                JOIN personal AS p ON p.id = r.personalId
                JOIN reimbursement_name AS n ON n.id = r.reimbursementNameId
                where r.id = '$id' "),
                "today" => array(
                    "year" => (int)date("Y"),
                    "month" => (int)date("m"),
                    "day" => (int)date("d"),
                ),
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

    function delete()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;

            $id = $post['id'];
            $update = array(
                "presence" => 0, 
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->update('reimbursement', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

 
}
