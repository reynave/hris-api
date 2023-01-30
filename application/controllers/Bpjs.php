<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Bpjs extends CI_Controller
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

    function setting(){
        $data = array(
            "items" => $this->model->sql("select * from bpjs_setting where presence = 1  order by id ASC "),
               
        );
        echo json_encode($data);
    }

    function fnSaveSetting(){
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            foreach($post['items'] as $row){
                $update = array(
                    "label" => $row['label'], 
                    "company" => $row['company'], 
                    "employee" => $row['employee'],    
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('bpjs_setting', $update, "id='".$row['id']."'");
            }
           
        

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }
}
