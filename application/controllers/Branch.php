<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Branch extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        /* if (!$this->model->header($this->openAPI)) {
             echo $this->model->error("Error auth");
            exit;
        }*/
    }


    function index()
    {
        $data = array(
            "data" => $this->model->sql("SELECT  * FROM branch WHERE  presence = 1 "),
        );
        echo json_encode($data);
    }
 
    
    function fnSave()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true; 
            $id = $post['id'];
            $update = array( 
                "name" => $post['model']['name'],  
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->update('organization', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }


    function insert()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $insert = array( 
                "name"          => $post['name'],  
                "organizationId" => $post['organizationId'],
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"), 
            );
            $this->db->insert('branch', $insert);
            $idBranch = $this->model->select("id","branch","1 order by inputDate desc");

            if($post['employmentId'] != ""){
                $update = array( 
                    "organizationId" => $post['organizationId'],
                    "branchId"      =>  $idBranch,   
                    "updateDate"    => date("Y-m-d H:i:s"), 
                );
                $this->db->update('employment', $update,"id = '".$post['employmentId']."' "); 
            }
           

            $data = array(
                "id" =>  $idBranch, 
            );
        }
        echo   json_encode($data);
    }

    function fnDelete()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;

            $id = $post['id'];
            $update = array(
                "presence" => 0,
                "status" => 0,
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->update('personal', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

    function fnCreateOtherForm(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            if($post['value'] == 'employment'){
                $personalId = $post['personalId'];
                $id = $this->model->number('employment');
                $insert = array( 
                    "id" => $id,
                    "personalId" => $personalId,
                    "inputDate"     => date("Y-m-d H:i:s"), 
                );
                $this->db->insert('employment', $insert);
    
            }
            if($post['value'] == 'payroll'){
                $personalId = $post['personalId'];
                $id = $this->model->number('payroll');
                $insert = array( 
                    "id" => $id,
                    "personalId" => $personalId,
                    "inputDate"     => date("Y-m-d H:i:s"), 
                );
                $this->db->insert('payroll', $insert);
    
            }
           
            $data = array(
                "id" => $id ,
                "error" => false,
            );
        }
        echo   json_encode($data);
    }
}
