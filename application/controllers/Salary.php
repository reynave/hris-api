<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Salary extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
            //  echo $this->model->error("Error auth");
            //   exit;
        }
    }

    
    function index()
    {
        $data = array(
            "data" => $this->model->sql("select * from personal where presence = 1"),
        );
        echo json_encode($data);
    }

    function datatables($id)
    {
        $data = array(
            "data" => $this->model->sql("select * from salary where presence = 1 and personalId = '$id' order by periodEndDate DESC"),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array( 
            "periodStartDate" => (int) $this->model->select("value", "global_setting", "id=51"),
            "periodEndDate" => (int) $this->model->select("value", "global_setting", "id=52"),
            "personalData" => $this->model->sql("select * from personal where presence = 1 and id = '$id' ")[0],
        );
        echo json_encode($data);
    }
 
    function fnGenerate(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;  
            $id = $this->model->number("salery").'.'.uniqid();
            $insert = array(
                "id" =>  $id,
                "periodStartDate" =>  $post['periodStartDate']['year'].'-'. $post['periodStartDate']['month'].'-'. $post['periodStartDate']['day'],  
                "periodEndDate"   =>  $post['periodEndDate']['year'].'-'. $post['periodEndDate']['month'].'-'. $post['periodEndDate']['day'],  
                
                "asLock"        => 0,  
                "personalId"    => $post['personalId'],   
                "inputDate"     => date("Y-m-d H:i:s"), 
                "inputBy"       => $this->model->userId(),  
            );

            $this->db->insert('salary', $insert); 
            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

    function reports($id){
        $data = array(  
            "item" => $this->model->sql("select * from salary where presence = 1 and id = '$id' ")[0],
        );
        echo json_encode($data);
    }
} 