<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Loan extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
         //   echo $this->model->error("Error auth");
           // exit;
        }
    }


    function index()
    {
        $q = "SELECT l.*, CONCAT('Rp ', FORMAT(l.amount, 0)) AS 'amount',
        p.name AS 'personal'
        from loan AS l
        JOIN personal AS p ON p.id = l.personalId
        WHERE l.presence = 1 AND l.STATUS = 1 and l.approved = 0 and p.id =  '".$this->model->userId()."'  ";

        $data = array(
            "q"=> $q,
            "data" => $this->model->sql($q ),

        );
        echo json_encode($data);
    }

    function admin()
    {
        $q = "SELECT l.*, CONCAT('Rp ', FORMAT(l.amount, 0)) AS 'amount',
        p.name AS 'personal', e.approvalLineId, a.name AS 'approvalLineName'
        from loan AS l
        JOIN personal AS p ON p.id = l.personalId 
        JOIN employment AS e ON e.personalId =l.personalId
        LEFT JOIN personal AS a ON a.id = e.approvalLineId
        WHERE l.presence = 1 AND l.STATUS = 1 and l.approved = 0 ";

        $data = array(
            "q"=> $q,
            "data" => $this->model->sql($q ),

        );
        echo json_encode($data);
    }
    function adminHistory()
    {
        $q = "SELECT l.*, CONCAT('Rp ', FORMAT(l.amount, 0)) AS 'amount',
        p.name AS 'personal', e.approvalLineId, a.name AS 'approvalLineName'
        from loan AS l
        JOIN personal AS p ON p.id = l.personalId 
        JOIN employment AS e ON e.personalId =l.personalId
        LEFT JOIN personal AS a ON a.id = e.approvalLineId
        WHERE l.presence = 1 AND l.STATUS = 1 and l.approved = 1 ";

        $data = array(
            "q"=> $q,
            "data" => $this->model->sql($q ),

        );
        echo json_encode($data);
    }

    function history()
    {
        $q = "SELECT l.*, CONCAT('Rp ', FORMAT(l.amount, 0)) AS 'amount' 
        from loan AS l 
        WHERE l.presence = 1 AND l.STATUS = 1 and l.approved = 1 and l.personalId =  '".$this->model->userId()."'  ";

        $items = [];
        foreach($this->model->sql($q) as $row){
            $temp = array(
                "paidInstallment" => $this->model->select("count(id)","loan_detail","loanId= '".$row['id']."' and presence = 1 and paidAmount > 0  ")
            );

            
            array_push($items,array_merge($temp, $row));
        }


        $data = array(
            "q"=> $q,
            "data" => $items,

        );
        echo json_encode($data);
    }

    function select()
    {
        $data = array(
            "selectPersonal" => $this->model->sql("SELECT id, name from personal 
            where presence = 1 and id =  '".$this->model->userId()."'
            order by name ASC"),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array(
            "selectPersonal" => $this->model->sql("SELECT id, name from personal 
            where presence = 1 and id =  '".$this->model->userId()."'
            order by name ASC"),
            "data" => $this->model->sql("SELECT * from loan where presence = 1 and id =  '$id' "),

        );
        echo json_encode($data);
    }
    function loanDetail($id)
    {
        $data = array(
            "selectPersonal" => $this->model->sql("SELECT id, name from personal 
            where presence = 1
            order by name ASC"),
            "data" => $this->model->sql("SELECT * from loan where presence = 1 and id =  '$id' "),
            "loanDetail" => $this->model->sql("SELECT * from loan_detail where presence = 1 and loanId =  '$id' order by installment ASC"),

        );
        echo json_encode($data);
    }
    function detailApproveLine($id)
    {
        $data = array(
            "selectPersonal" => $this->model->sql("SELECT id, name from personal 
            where presence = 1  
            order by name ASC"),
            "data" => $this->model->sql("SELECT * from loan where presence = 1 and id =  '$id' "),

        );
        echo json_encode($data);
    }

    function insert()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            $id = $this->model->number('loan');
            $error = true;
            $effectiveDate = $post['item']['effectiveDate']['year'] . "-" . $post['item']['effectiveDate']['month'] . "-" . $post['item']['effectiveDate']['day'];

            $insert = array(
                "id" => $id,
                "personalId" => $post['item']['personalId'],
                "amount" => $post['item']['amount'],
                "installment" => $post['item']['installment'],
                "description" => $post['item']['description'],
                "effectiveDate" => $effectiveDate,
                "inputDate" => date("Y-m-d H:i:s"),
                "approved" => 0,
            );
            $this->db->insert("loan", $insert);
           
            $data = array(
                "error" => false,
                "id" => $id,

            );
            echo json_encode($data);
        }

    }
    function update()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {  
            $effectiveDate = $post['item']['effectiveDate']['year'] . "-" . $post['item']['effectiveDate']['month'] . "-" . $post['item']['effectiveDate']['day'];

            $update = array(  
                "amount" => $post['item']['amount'],
                "installment" => $post['item']['installment'],
                "description" => $post['item']['description'],
                "effectiveDate" => $effectiveDate,
                "updateDate" => date("Y-m-d H:i:s"),
                "approved" => 0,
            );
            $this->db->update("loan", $update,"id='".$post['id']."'");
           
            $data = array(
                "error" => false,  
            );
            echo json_encode($data);
        }

    }


    function remove()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {   
            $update = array(  
                "presence" =>0, 
                "updateDate" => date("Y-m-d H:i:s"), 
            );
            $this->db->update("loan", $update,"id='".$post['id']."'");
           
            $data = array(
                "error" => false,  
            );
            echo json_encode($data);
        }

    }
    function approved()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            $id =$post['id'];
            $error = true;
            $effectiveDate = $post['item']['effectiveDate']['year'] . "-" . $post['item']['effectiveDate']['month'] . "-" . $post['item']['effectiveDate']['day'];

            $update = array(  
                "amount" => $post['item']['amount'],
                "installment" => $post['item']['installment'],
                "description" => $post['item']['description'],
                "effectiveDate" => $effectiveDate,
                "updateDate" => date("Y-m-d H:i:s"),
                "approved" => 1,
                "approvedDate" =>  date("Y-m-d H:i:s"),
                "approvedBy" => $this->model->userId(),
            );
            $this->db->update("loan", $update,"id='".$post['id']."'");


            $personalId = $this->model->select("personalId","loan","id='".$post['id']."'");
            $employmentId = $this->model->select("id","loan","personalId='".$personalId."'");
         
            for ($i = 1; $i <= $post['item']['installment']; $i++) {

                $time = strtotime($effectiveDate);
 
                $final = date("Y-m-d", strtotime("+$i month", $time));
                $paymentAmount =  ceil($post['item']['amount'] / $post['item']['installment']);
                $insert2 = array(
                    "loanId" => $id,
                    "installment" => $i,
                    "employmentId" => $employmentId,
                    "personalId" => $personalId, 
                    "paymentAmount" =>  $paymentAmount,
                    "paymentDate" => $final,
                    "balance" =>  $paymentAmount,
                    "paidAmount" => 0, 
                    "inputDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert("loan_detail", $insert2);
            }


            $data = array(
                "error" => false,
                "id" => $id,

            );
            echo json_encode($data);
        }

    }

}