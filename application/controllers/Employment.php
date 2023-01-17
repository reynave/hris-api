<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Employment extends CI_Controller
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
            "data" => $this->model->sql("SELECT e.*, 
            p.name AS 'personal', jl.name AS 'jobLevel', jp.name AS 'jobPosition',
            s.name AS 'empyStatus', o.name AS 'organization', a.name AS 'approvedLine'
            from employment AS e
            JOIN personal AS p ON p.id = e.personalId
            LEFT JOIN employment_joblevel AS jl ON jl.id = e.jobLevelId
            LEFT JOIN employment_jobposition AS jp ON jp.id = e.jobPositionId
            LEFT JOIN employment_status AS s ON s.id = e.employmentStatusId
            LEFT JOIN organization AS o ON o.id = e.organizationId
            LEFT JOIN personal AS a ON a.id = e.approvalLineId
            
            WHERE e.presence = 1 "),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $branch = [];
        $item = $this->model->sql("SELECT e.*, p.name from employment AS e
        JOIN personal AS p ON p.id = e.personalId
        WHERE e.presence = 1 and  e.id = '$id' ");

        $data = array(
            "item" => $item,
            "employmentStatus" =>  $this->model->sql("SELECT * from employment_status"), 
            "approvedLine" =>  $this->model->sql("SELECT id, name from personal where presence = 1 order by name ASC  "),
            "JobPosition" =>  $this->model->sql("SELECT * from employment_jobposition where presence = 1 order by name ASC"), 
            "JobLevel" =>  $this->model->sql("SELECT * from employment_joblevel  where presence = 1 order by name ASC"), 
            "organization" =>  $this->model->sql("SELECT * from organization  where presence = 1 order by name ASC"), 
            "branch" =>$this->model->sql("SELECT * from branch  where organizationId = '".$item[0]['organizationId']."' and presence = 1 order by name ASC"), 
           
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
            if(isset($post['model']['branch'])){
                $insert = array(
                    "organizationId" =>  $post['model']['organizationId'],
                    "name" => $post['model']['branch'],
                    "inputDate"    => date("Y-m-d H:i:s"),
                    "updateDate"    => date("Y-m-d H:i:s"),
                ); 
                $this->db->insert('branch', $insert);
                $idBranch = $this->model->select("id", "branch", "1 order by inputDate desc");
            }
            $id = $post['id'];
            $update = array( 
                "dateJoinStart" =>  $post['model']['dateJoinStart']['year'] . "-" . $post['model']['dateJoinStart']['month'] . "-" . $post['model']['dateJoinStart']['day'],
                "dateJoinEnd" =>  $post['model']['dateJoinEnd']['year'] . "-" . $post['model']['dateJoinEnd']['month'] . "-" . $post['model']['dateJoinEnd']['day'],
                "jobLevelId" => $post['model']['jobLevelId'], 
                "jobPositionId" => $post['model']['jobPositionId'], 
                "branchId" => isset($post['model']['branch']) ?  $idBranch : $post['model']['branchId'], 
                "approvalLineId" => $post['model']['approvalLineId'], 
                "employmentStatusId" => $post['model']['employmentStatusId'],  
                "organizationId" => $post['model']['organizationId'],   
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->update('employment', $update, "id='$id'");

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
