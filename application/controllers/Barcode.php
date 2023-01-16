<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Barcode extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();  
        $this->openAPI = $this->db->openAPI;
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->openAPI)) {
            echo $this->model->error("Error auth");
            exit;
       }
      
    }


    function index()
    {
        $data = array( 
            "items" => $this->model->sql("SELECT * from cso1_account
                where id >= 50 and id <= 59
                order by id ASC"),
        ); 
        echo json_encode($data); 
    } 

    function fnUpdate(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $update = array(
                "value" => $post['value']."",
                "updateDate" => time(),
                "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"id='".$post['id']."' ");  
        }
        echo   json_encode($post);
    }
     
 
}
