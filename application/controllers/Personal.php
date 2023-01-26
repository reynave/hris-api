<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Personal extends CI_Controller
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
            "data" => $this->model->sql("select * from personal where presence = 1"),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array(
            "item" => $this->model->sql("select * from personal where presence = 1 and id = '$id' "),
            "personal_religion" =>  $this->model->sql("select * from personal_religion where presence = 1  "),
            "personal_marital" =>  $this->model->sql("select * from personal_marital where presence = 1  "),
            "employmentId" =>  $this->model->select("id","employment","personalId = '$id' and presence = 1 and status = 1"),
            "payrollId" => $this->model->select("id","payroll","personalId = '$id' and presence = 1 and status = 1"),
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
                "permanent" => $post['model']['permanent'],
                "name" => $post['model']['name'],
                "phone" => $post['model']['phone'],
                "email" => $post['model']['email'],
                "birthPlace" => $post['model']['birthPlace'],
                "birthDate" =>  $post['model']['birthDate']['year'] . "-" . $post['model']['birthDate']['month'] . "-" . $post['model']['birthDate']['day'],
                "gender" => $post['model']['gender'],
                "marital" => $post['model']['marital'],
                "blood" => $post['model']['blood'],
                "religion" => $post['model']['religion'],
                "idType" => $post['model']['idType'],
                "idNumber" => $post['model']['idNumber'],
                "expDate" =>  $post['model']['expDate']['year'] . "-" . $post['model']['expDate']['month'] . "-" . $post['model']['expDate']['day'],
                "postalCode" => $post['model']['postalCode'],
                "address" => $post['model']['address'],

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


    function insert()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $this->model->number('personal');
            $insert = array(
                "id" => $id,
                "name"          => $post['name'],
                "phone"          => $post['phone'],
                "email"          => $post['email'],
                "gender"          => $post['gender'],

                "birthDate" => $post['birthDate']['year'] . "-" . $post['birthDate']['month'] . "-" . $post['birthDate']['day'],
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->insert('personal', $insert);

            $data = array(
                "id" => $id,
                "items" =>  $post,
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
