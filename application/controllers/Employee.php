<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Employee extends CI_Controller
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
            "data" => $this->model->sql("SELECT p.id, p.idx,  p.name,
            jl.name AS 'jobLevel', jp.name AS 'jobPosition',
            s.name AS 'empyStatus', o.name AS 'organization', a.name AS 'approvedLine', b.name as 'branch',
            e.dateJoinStart,   e.totalHoliday
            FROM personal AS p
            LEFT JOIN employment AS e ON e.personalId = p.id 
            LEFT JOIN employment_joblevel AS jl ON jl.id = e.jobLevelId
            LEFT JOIN employment_jobposition AS jp ON jp.id = e.jobPositionId
            LEFT JOIN employment_status AS s ON s.id = e.employmentStatusId
            LEFT JOIN organization AS o ON o.id = e.organizationId
            LEFT JOIN personal AS a ON a.id = e.approvalLineId
            LEFT JOIN branch AS b ON b.id = e.branchId
            WHERE p.presence = 1 "),
        );
        echo json_encode($data);
    }

    function reminderExp()
    {
        $n = 30;
        $data = array(
            "data" => $this->model->sql(" SELECT   e.personalId as 'id',  DATEDIFF(e.dateJoinEnd,NOW()) AS 'expDate', 
            p.name, e.dateJoinEnd, e.dateJoinStart, es.name AS 'employmentStatus' 
            FROM  employment AS e
            JOIN employment_status AS es ON es.id = e.employmentStatusId
            JOIN personal AS p ON p.id = e.personalId
            WHERE e.presence = 1 AND e.STATUS = 1 and DATEDIFF(e.dateJoinEnd,NOW()) < $n"),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array(
            "employmentId" => $this->model->select("id", "employment", "personalId = '$id'"),
            "payrollId" => $this->model->select("id", "payroll", "personalId = '$id'"),

        );
        echo json_encode($data);
    }

    function contact($personalId)
    {
        $branch = [];
        $id = $this->model->select("id", "employment", "personalId = '$personalId'");
        $item = $this->model->sql("SELECT e.*, p.name from employment AS e
        JOIN personal AS p ON p.id = e.personalId
        WHERE e.presence = 1 and  e.id = '$id' ");

        $data = array(
            "id" => $id,
            "item" => $item,
            "personal" => $this->model->sql("SELECT *  from personal WHERE id = '$personalId' "),
            "globalSetting" => array(
                "companyName" => $this->model->select("value","global_setting","id=2"),
                "CompanyAddress" => $this->model->select("value","global_setting","id=3"),
                
            )

            // "employmentStatus" =>  $this->model->sql("SELECT * from employment_status"), 
            // "approvedLine" =>  $this->model->sql("SELECT id, name from personal where presence = 1 order by name ASC  "),
            // "JobPosition" =>  $this->model->sql("SELECT * from employment_jobposition where presence = 1 order by name ASC"), 
            // "JobLevel" =>  $this->model->sql("SELECT * from employment_joblevel  where presence = 1 order by name ASC"), 
            // "organization" =>  $this->model->sql("SELECT * from organization  where presence = 1 order by name ASC"), 

        );
        echo json_encode($data);
    }


    function fnCreate()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            $personalId = $post['id'];
            if ($post['value'] == 'employment') {

                $id = $this->model->number('employment');
                $insert = array(
                    "id" => $id,
                    "personalId" => $personalId,
                    "inputDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('employment', $insert);

            }
            if ($post['value'] == 'payroll') {

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
    }

}