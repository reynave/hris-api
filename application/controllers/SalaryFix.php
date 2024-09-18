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


            $branchId = $post['items'][0][0];
            $startDate = $post['items'][0][2];
            $endDate = $post['items'][0][3];


            for ($i = 2; $i < count($post['items']); $i++) {
                $row = $post['items'][$i];
 
                if (count($row) > 4) {
                    $personalId = strtolower(url_title($row[0]));

                    if(!$this->model->select("id","personal","id = '$personalId' ")){
                        $insertSalary = array( 
                            "id" => $personalId,
                            "name" => $row[1], 
                            "email" => $personalId."@hris.com",  
                            "presence" => 1,  
                            "inputDate" => date("Y-m-d H:i:s"),
                        );
                        $this->db->insert("personal", $insertSalary);
                    }

                    $insertSalary = array(
                        "branchId" => $branchId,
                        "startDate" => $startDate,
                        "endDate" => $endDate, 
                        "personalId" => $personalId,

                        "position" => $row[2],
                        "ratePerHours" =>  (int)$row[3],
                        "qty" => (int)$row[4],
                        "total" =>  (int)$row[5],
                        "tax" =>  (int)$row[6],
                        "loan" =>  (int)$row[7],
                        "bpjs" =>  (int)$row[8],
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
}