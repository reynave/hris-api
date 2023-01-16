<?php
defined('BASEPATH') or exit('No direct script access allowed');
class AutoNumber extends CI_Controller
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
            "items" => $this->model->sql("select * from autoNumber order by name ASC"),
        ); 
        echo json_encode($data); 
    } 

     
 
}
