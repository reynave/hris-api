<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Header extends CI_Controller
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
        $header = apache_request_headers();
        $token = $header['Token'];

        $id = $this->model->select("personalId", "personal_access", "token = '$token'");
        $jobPositionId = $this->model->select("jobPositionId", "employment", "personalId = '$id'");
       



        $data = array( 
            "jobPositionId" => $jobPositionId,
            "module" => $this->model->sql("select * from employment_jobposition where id = ".$jobPositionId)[0],
            "id" => $this->model->select("personalId","personal_access","token = '$token'"),
          //  "header" =>$header,
            "token" => $token,
            "error" => false,
        );
        echo json_encode($data);
    }

}