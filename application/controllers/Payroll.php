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
        if (!$this->model->header($this->db->openAPI)) {
            echo $this->model->error("Error auth");
            exit;
        }
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

        $thead = array(
            'companyBPSJ' => $this->model->select("company", "bpjs_setting", "id=200"),
            'companyJHT' => $this->model->select("company", "bpjs_setting", "id=100"),
            'companyJP' => $this->model->select("company", "bpjs_setting", "id=112"),

            'employeeBPSJ' => $this->model->select("employee", "bpjs_setting", "id=200"),
            'employeeJHT' => $this->model->select("employee", "bpjs_setting", "id=100"),
            'employeeJP' => $this->model->select("employee", "bpjs_setting", "id=112"),

        );

        $item = $this->model->sql("SELECT e.*, 
            p.name AS 'personal'
            from payroll AS e
            JOIN personal AS p ON p.id = e.personalId 
            WHERE e.presence = 1 and   e.id = '$id' ");

        $salery = $item[0]['taxSalary'];
        self::createTunjuangan($personalId);
        $data = array(
            "thead" => $thead,
            "item" => $item,
            "tunjangan" => $this->model->sql("SELECT t.* , l.label
            FROM 
            payroll_tunjangan AS t
            JOIN salary_label AS l ON t.sorting = l.sorting
            WHERE t.personalId = '$personalId' order by sorting ASC"),
            "bpjs" => array(
                "jht" => (($thead['companyBPSJ'] + $thead['employeeBPSJ']) / 100) * $salery,
                "jp" => (($thead['companyJP'] + $thead['employeeJP']) / 100) * $salery,
                "kesehatan" => (($thead['companyBPSJ'] + $thead['employeeBPSJ']) / 100) * $salery
            ),
            "pph21_ptkp" => $this->model->sql("select * from pph21_ptkp order by sorting ASC "),
        );
        echo json_encode($data);
    }

    function createTunjuangan($personalId)
    {
        $sql = $this->model->sql("select * from salary_label where asCopy = 1 and presence = 1 ");
        foreach ($sql as $row) {  
            $insert = array(
                "personalId" => $personalId,
                "value" => $row['value'],
                "sorting" => $row['sorting'], 
            );
            if(!$this->model->select("id","payroll_tunjangan"," personalId= '$personalId' and sorting = '".$row['sorting']."' ") ){
                $this->db->insert("payroll_tunjangan", $insert);
            } 
        }
    }

    function fnSave()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            $personalId = $post['id'];
            $id = $this->model->select("id", "payroll", "personalId = '$personalId'");
            $update = array(
                "taxableDate" => !isset($post['model']['taxableDate']) ? '' : $post['model']['taxableDate']['year'] . "-" . $post['model']['taxableDate']['month'] . "-" . $post['model']['taxableDate']['day'],
                "bpjsTkDate" => !isset($post['model']['bpjsTkDate']) ? '' : $post['model']['bpjsTkDate']['year'] . "-" . $post['model']['bpjsTkDate']['month'] . "-" . $post['model']['bpjsTkDate']['day'],
                "JaminanPensiunDate" => !isset($post['model']['JaminanPensiunDate']) ? '' : $post['model']['JaminanPensiunDate']['year'] . "-" . $post['model']['JaminanPensiunDate']['month'] . "-" . $post['model']['JaminanPensiunDate']['day'],


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

            foreach( $post['salaryTunjangan'] as $row){
                $update1 = array(
                    "value" => $row['value']
                );
                $this->db->update('payroll_tunjangan', $update1, "id='".$row['id']."'"); 
            }
        

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


    function fnDeleteTunjangan(){
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $this->db->delete("payroll_tunjangan",  "id=" . $post['id']);
            $data = array( 
                "post" => $post,
            );
            echo json_encode($data);
           
        
        }
    }
}