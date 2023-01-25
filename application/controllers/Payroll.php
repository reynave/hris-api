<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Payroll extends CI_Controller
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
            p.name AS 'personal'
            from payroll AS e
            JOIN personal AS p ON p.id = e.personalId
            
            WHERE e.presence = 1 "),
        );
        echo json_encode($data);
    }

    function detail($personalId)
    {
        $branch = [];
        $id = $this->model->select("id", "payroll", "personalId = '$personalId'");
        $item = $this->model->sql("SELECT e.*, 
            p.name AS 'personal'
            from payroll AS e
            JOIN personal AS p ON p.id = e.personalId 
            WHERE e.presence = 1 and   e.id = '$id' ");

        $data = array(
            "item" => $item,
        );
        echo json_encode($data);
    }

    function fnSave()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            /*
            public salary: string,
            public : string,
            public : string,
            public : string,
            public : string,
            public : any,
            public : string,  */
            $id = $post['id'];
            $update = array(
                "taxableDate" => !isset($post['model']['taxableDate']) ? '' :  $post['model']['taxableDate']['year'] . "-" . $post['model']['taxableDate']['month'] . "-" . $post['model']['taxableDate']['day'],
                "bpjsTkDate" => !isset($post['model']['bpjsTkDate']) ? '' : $post['model']['bpjsTkDate']['year'] . "-" . $post['model']['bpjsTkDate']['month'] . "-" . $post['model']['bpjsTkDate']['day'],
                "JaminanPensiunDate" => !isset($post['model']['JaminanPensiunDate']) ? '' :  $post['model']['JaminanPensiunDate']['year'] . "-" . $post['model']['JaminanPensiunDate']['month'] . "-" . $post['model']['JaminanPensiunDate']['day'],
               
                
                "salary" => $post['model']['salary'], 
                "salaryType" => $post['model']['salaryType'],
                "bankName" => $post['model']['bankName'],
                "bankAccountNumber" => $post['model']['bankAccountNumber'],
                "bankAccountHolderName" => $post['model']['bankAccountHolderName'],
                "hourlyRate" => $post['model']['hourlyRate'],
                "tunjangan" => $post['model']['tunjangan'],
                

                "taxNpwp" => $post['model']['taxNpwp'],
                "taxMethod" => $post['model']['taxMethod'],
                "taxHolderName" => $post['model']['taxHolderName'],
                "taxPtkpStatus" => $post['model']['taxPtkpStatus'],
                "taxSalary" => $post['model']['taxSalary'],
                "EmploymentTaxStatus" => $post['model']['EmploymentTaxStatus'],
                "taxPktpAccountHolder" => $post['model']['taxPktpAccountHolder'],
                "bpsjTkNo" => $post['model']['bpsjTkNo'],
                "bpsjKesehatanNo" => $post['model']['bpsjKesehatanNo'],
                "JhtCost" => $post['model']['JhtCost'],
                "JaminanPensiunCost" => $post['model']['JaminanPensiunCost'],
                "bpjsKesehatanFamily" => $post['model']['bpjsKesehatanFamily'],
                

                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update('payroll', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }


    function insert()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $this->model->number('personal');
            $insert = array(
                "id" => $id,
                "name" => $post['name'],
                "phone" => $post['phone'],
                "email" => $post['email'],
                "gender" => $post['gender'],

                "birthDate" => $post['birthDate']['year'] . "-" . $post['birthDate']['month'] . "-" . $post['birthDate']['day'],
                "inputDate" => date("Y-m-d H:i:s"),
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->insert('personal', $insert);

            $data = array(
                "id" => $id,
                "items" => $post,
            );
        }
        echo json_encode($data);
    }

    function fnDelete()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;

            $id = $post['id'];
            $update = array(
                "presence" => 0,
                "status" => 0,
                "inputDate" => date("Y-m-d H:i:s"),
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update('personal', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function fnCreateOtherForm()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            if ($post['value'] == 'employment') {
                $personalId = $post['personalId'];
                $id = $this->model->number('employment');
                $insert = array(
                    "id" => $id,
                    "personalId" => $personalId,
                    "inputDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('employment', $insert);

            }
            if ($post['value'] == 'payroll') {
                $personalId = $post['personalId'];
                $id = $this->model->number('payroll');
                $insert = array(
                    "id" => $id,
                    "personalId" => $personalId,
                    "inputDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('payroll', $insert);

            }

            $data = array(
                "id" => $id,
                "error" => false,
            );
        }
        echo json_encode($data);
    }
}