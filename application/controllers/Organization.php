<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Organization extends CI_Controller
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
            "data" => $this->model->sql("SELECT  * FROM organization WHERE  presence = 1 "),
        );
        echo json_encode($data);
    }
    function branch($organizationId)
    {
        $data = array(
            "data" => $this->model->sql("SELECT  * FROM branch WHERE organizationId = '$organizationId' and   presence = 1 "),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $branch = [];
        foreach( $this->model->sql("SELECT * from organization  where presence = 1 order by name ASC")  as $row){
            $temp = []; 

            $temp = array(
                "id" => $row['id'],
                'name' => $row['name'],
                "items" => $this->model->sql("SELECT * from branch 
                where presence = 1 and organizationId = ".$row['id']." order by name ASC") ,
            );

            array_push($branch, $temp);
        }

        $data = array(
            "item" => $this->model->sql("SELECT e.*, p.name from employment AS e
            JOIN personal AS p ON p.id = e.personalId
            WHERE e.presence = 1 and  e.id = '$id' "),
            "employmentStatus" =>  $this->model->sql("SELECT * from employment_status"), 
            "approvedLine" =>  $this->model->sql("SELECT id, name from personal where presence = 1 order by name ASC  "),
            "JobPosition" =>  $this->model->sql("SELECT * from employment_jobposition where presence = 1 order by name ASC"), 
            "JobLevel" =>  $this->model->sql("SELECT * from employment_joblevel  where presence = 1 order by name ASC"), 
            "organization" =>  $this->model->sql("SELECT * from organization  where presence = 1 order by name ASC"), 
            "branch" =>  $branch, 
            
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
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"), 
            );
            $this->db->insert('organization', $insert);
            $idOrganization = $this->model->select("id","organization","1 order by inputDate desc");

            if($post['employmentId'] != ""){
                $update = array( 
                    "organizationId"          =>  $idOrganization,   
                    "updateDate"    => date("Y-m-d H:i:s"), 
                );
                $this->db->update('employment', $update,"id = '".$post['employmentId']."' "); 
            }
           

            $data = array(
                "id" =>  $idOrganization, 
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
