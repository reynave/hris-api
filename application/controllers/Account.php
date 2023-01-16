<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Account extends CI_Controller
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
         return false;
    } 
    function profile()
    { 
        
        $data = array(
            "companyId" =>  $this->model->select("value","cso1_account"," id = 1"),
            "licenseKey" =>  $this->model->select("value","cso1_account"," id = 2"),
            "companyName" =>  $this->model->select("value","cso1_account"," id = 10"),
            "companyAddress" =>  $this->model->select("value","cso1_account"," id = 11"),
            "companyPhone" =>  $this->model->select("value","cso1_account"," id = 12"),
            "roundMethod" =>  $this->model->select("value","cso1_account"," id = 100"),
            "taxId" =>  $this->model->select("value","cso1_account"," id = 101"), 
            "customerPhoto" =>  $this->model->select("value","cso1_account"," id = 201"), 
            "logo" =>  $this->model->select("value","cso1_account"," id = 14"), 
            "memberPhoto" =>  $this->model->select("value","cso1_account"," id = 15"), 
            "visitorPhoto" =>  $this->model->select("value","cso1_account"," id = 16"), 
           
        ); 
        echo   json_encode($data);
    }
    function profile_update()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) { 
            $update = array(
                "value" => $post['companyName'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='companyName'"); 

            $update = array(
                "value" => $post['companyAddress'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='companyAddress'"); 

            $update = array(
                "value" => $post['companyPhone'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='companyPhone'"); 

            $update = array(
                "value" => (string)$post['roundMethod'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='roundMethod'"); 

            $update = array(
                "value" => $post['taxId'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='taxId'"); 

            $update = array(
                "value" => (string)$post['memberPhoto'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='memberPhoto'"); 

            $update = array(
                "value" => (string)$post['visitorPhoto'],  "updateDate" => time(),  "updateBy" => $this->model->userId(),
            );
            $this->db->update('cso1_account', $update,"name='visitorPhoto'"); 

        }
        echo   json_encode($post);
    } 
 
}
