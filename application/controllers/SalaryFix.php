<?php
defined('BASEPATH') or exit('No direct script access allowed');
class SalaryFix extends CI_Controller
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
            "error" => true,
            "selectBranch" => $this->model->sql("SELECT branchId 
                FROM salary_fix  
                GROUP BY branchId
            "),
        );
        echo json_encode($data);

    }
    function onSubmit()
    {
        $id = 0;
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );

        if ($post) {
            $error = false;
            $this->db->trans_start();

            $uploadId = uniqid();
            $branchId = $post['headerSalery'][0][0];
            $startDate = $post['headerSalery'][0][2];
            $endDate = $post['headerSalery'][0][3];


            for ($i = 0; $i < count($post['items']); $i++) {
                $row = $post['items'][$i];

                if (count($row) > 4) {
                    $personalId = strtolower(url_title($row[0]));

                    if (!$this->model->select("id", "personal", "id = '$personalId' ")) {
                        $insertSalary = array(
                            "id" => $personalId,
                            "name" => $row[1],
                            "email" => $personalId . "@hris.com",
                            "presence" => 1,
                            "inputDate" => date("Y-m-d H:i:s"),
                        );
                        $this->db->insert("personal", $insertSalary);
                    }

                    if (!$this->model->select("id", "employment", "personalId = '$personalId' ")) {
                        $idEmployment = $this->model->number('employment');
                        $insertSalary = array(
                            "id" =>  $idEmployment,
                            "personalId" => $personalId,
                            "branchId" => $branchId, 
                            
                            "presence" => 1,
                            "status" => 1,
                            "inputDate" => date("Y-m-d H:i:s"),
                        );
                        $this->db->insert("employment", $insertSalary);
                    }



                    $insertSalary = array(
                        "uploadId" => $uploadId,
                        "branchId" => $branchId,
                        "startDate" => $startDate,
                        "endDate" => $endDate,
                        "personalId" => $personalId,

                        "position" => $row[2],
                        "ratePerHours" => (int) $row[3],
                        "qty" => (int) $row[4],
                        "total" => (int) $row[5],
                        "tax" => (int) $row[6],
                        "loan" => (int) $row[7],
                        "bpjs" => (int) $row[8],

                        "treatmentDate" =>  $row[10],
                        "treatmentTime" =>  $row[11],
                        "patientName" => $row[12],
                        
                        "presence" => 1,

                        "inputDate" => date("Y-m-d H:i:s"),
                        "inputBy" => $this->model->userId(),
                    );
                    $this->db->insert("salary_fix", $insertSalary);
                }


            }


            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE) {
                $error = true;
            }
            $data = array(
                "error" => $error,
                "post" => $post,
                "count" => count($post['items']),
            );
        } else {
            $data = array(
                "error" => true,
            );
        }
        echo json_encode($data);
    }

    function datatables()
    {
        $id = $_GET['id'];
        $q = "SELECT   branchId, personalId, concat(YEAR(treatmentDate) , '-', MONTH(treatmentDate) )AS 'period',
                SUM(total - tax - loan - bpjs) AS 'grandTotal', YEAR(treatmentDate) as 'year',MONTH(treatmentDate) as 'month'
                FROM salary_fix 
                WHERE presence = 1 AND personalId =  '$id' 
                GROUP BY MONTH(treatmentDate), YEAR(treatmentDate), branchId
                ORDER BY treatmentDate DESC 
            ";
        $data = array(
            "q" => $q,
            "data" => $this->model->sql($q),
        );
        echo json_encode($data);
    }

    function datatablesDetail()
    {
        $get = $this->input->get();
        $data = array(
            "data" => $this->model->sql("SELECT * , (total - tax - loan - bpjs) AS 'grandTotal'
                FROM salary_fix WHERE presence = 1 
                AND branchId = '" . $get['branchId'] . "' and  personalId = '" . $get['id'] . "' AND MONTH(treatmentDate) = '" . $get['month'] . "' 
                AND  YEAR(treatmentDate) = '" . $get['year'] . "'
                ORDER BY treatmentDate ASC
            "),
        );
        echo json_encode($data);
    }

    function findUploadId()
    {
        $get = $this->input->get();
        $data = array(
            "data" => $this->model->sql("SELECT 
                uploadId, COUNT(id) AS 'totalRow', startDate, endDate
            FROM salary_fix 
            WHERE uploadId = '" . $get['uploadId'] . "' 
            GROUP BY uploadId,startDate, endDate 
            "),
        );
        echo json_encode($data);
    }
    function onDelete()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );

        if ($post) {
            $this->db->delete('salary_fix', "uploadId='" . $post['uploadId'] . "'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function report()
    {
        $get = $this->input->get();
        $data = array(
            "error" => true,
            "items" => $this->model->sql("SELECT a.* , p.name
                FROM (
                SELECT branchId, personalId, startDate, endDate, 
                    SUM( total) AS 'total',
                    SUM( tax) AS 'tax',
                    SUM( loan) AS 'loan',
                    SUM( bpjs) AS 'bpjs',
                    SUM(total - tax - loan - bpjs) AS 'grandTotal'
                FROM salary_fix   
                WHERE branchId = '" . $get['branchId'] . "' AND 
                (startDate >= '" . $get['startDate'] . "' AND endDate <= '" . $get['endDate'] . "' )
                GROUP BY personalId, startDate, endDate) a
                LEFT JOIN personal AS p ON p.id = a.personalId 
                order by p.name ASC
            "),
        );
        echo json_encode($data);
    }
}