<?php
defined('BASEPATH') or exit('No direct script access allowed');
class GlobalSetting extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();  
        $this->openAPI = $this->db->openAPI;
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        if (!$this->model->header($this->openAPI)) {
            echo $this->model->error("Error auth");
            exit;
        }
    }


    function index()
    {
        $data = array( 
            "greeting" => $this->model->sql("SELECT * FROM cso1_greeting where  presence = 1 order by publishDate"),
            "account" => array( 
                "value1" => $this->model->select("value","cso1_account","id=1001"),
                "value2" => $this->model->select("value","cso1_account","id=1002"),
                "value3" => $this->model->select("value","cso1_account","id=1003"),
                "value4" => $this->model->select("value","cso1_account","id=1004"),
                "value5" => $this->model->select("value","cso1_account","id=1005"),
                "value6" => $this->model->select("value","cso1_account","id=1006"),
                "value7" => $this->model->select("value","cso1_account","id=1007"),
                "value8" => $this->model->select("value","cso1_account","id=1008"),
                "value9" => $this->model->select("value","cso1_account","id=1009"), 
                "img"  =>  $this->model->select("value","cso1_account","id=1010"), 
                
            ),
            
        ); 

        echo json_encode($data); 
    } 

    function fnUpdateAccount(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $update = array(
                "name" => $post['name'],
                "value" => $post['value'],
                "updateDate" => time(),
                "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"id=".(1000+$post['id'])); 

            $data = array(
                "items" =>  $post,
            );
        }
        echo   json_encode($data);
    }

    function fnInsertGreeting()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $insert = array(   
                "presence" => 1,
                "inputDate" => time(),
                "inputBy" => $this->model->userId(),
                "updateDate" => time(),
                "updateBy" => $this->model->userId(),
            );
            $this->db->insert('cso1_greeting', $insert);

            $data = array(
                "items" =>  $post,
            );
        }
        echo   json_encode($data);
    }

    function deleteGreeting(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $update = array(
                "presence" => 0,
                "updateDate" => time(),
                "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_greeting', $update,"id=".$post['id']); 
       
        }
        echo   json_encode($post);
    }

    function updateGreeting(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $update = array(
                "status" => $post['status'],
                "message" => $post['message'], 
                "publishDate" => $post['publishDate'],  
                "updateDate" => time(),
                "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_greeting', $update,"id=".$post['id']);  
        }
        echo   json_encode($post);
    }
 
}
