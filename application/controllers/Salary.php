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
            "data" => $this->model->sql("SELECT * 
                FROM salary WHERE presence = 1 AND personalId = '$id' 
                ORDER BY periodEndDate DESC
            "),
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

    function fnDelete()
    {
        $id = 0;
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );

        if ($post) {
            $error = false;
            $this->db->trans_start();

            $id = $post['id'];

            $update = array(
                "presence"=> 0,
            );

            $this->db->update("salary",$update,"id = '$id'");
            $this->db->update("salary_detail",$update,"salaryId = '$id'");
            $this->db->update("salary_time",$update,"salaryId = '$id'"); 

            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE) {
                $error = true;
            }
            $data = array( 
                "error" => $error, 
            ); 
        } else {
            $data = array(
                "error" => true,
            );
        }
        echo json_encode($data);
    }
    function fnGenerate()
    {
        $id = 0;
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );

        if ($post) {
            $this->db->trans_start();
            $error = false;
            $id = $this->model->number("salery") . '.' . uniqid();
            $insertSalary = array(
                "id" => $id,
                "periodStartDate" => $post['periodStartDate']['year'] . '-' . $post['periodStartDate']['month'] . '-' . $post['periodStartDate']['day'],
                "periodEndDate" => $post['periodEndDate']['year'] . '-' . $post['periodEndDate']['month'] . '-' . $post['periodEndDate']['day'],
                "asLock" => 0,
                "personalId" => $post['personalId'],
                "inputDate" => date("Y-m-d H:i:s"),
                "inputBy" => $this->model->userId(),
            );

            $this->db->insert('salary', $insertSalary);
            $as = $this->model->sql("SELECT * FROM salary_label where status = 1");

            foreach ($as as $rec) {
                $insertDetail = array(
                    "salaryId" => $id,
                    "label" => $rec['label'],
                    "value" => $rec['value'],
                    "sorting" => $rec['sorting'],
                    "asLock" => 0,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "inputBy" => $this->model->userId(),
                );
                $this->db->insert('salary_detail', $insertDetail);
            }

            $update1 = array(
                "value" => $this->model->select("salary", "payroll", "personalId = '" . $post['personalId'] . "' "),
            );
            $this->db->update('salary_detail', $update1, " sorting = 100 and salaryId = '$id' ");


            foreach ($post['timeManagement'] as $row) {
                $insert = array(
                    "salaryId" => $id,
                    "date" => $row['date'],
                    "hour" => $row['hour'],
                    "job" => $row['job'],
                    "checkIn" => $row['checkIn'] ? $row['checkOut'] : "00:00:00",
                    "checkOut" => $row['checkOut'] ? $row['checkOut'] : "00:00:00",
                    "workingHour" => $row['workingHour'] ? str_replace(["h", "m"], ":", $row['workingHour']) : "00:00:00",
                    "late" => $row['late'] ? str_replace(["h", "m"], ":", $row['late']) : "00:00:00",
                    "quickly" => $row['quickly'] ? str_replace(["h", "m"], ":", $row['quickly']) : "00:00:00",
                    "overtime" => $row['overtime'] ? str_replace(["h", "m"], ":", $row['overtime']) : "00:00:00",
                    "workDay" => $row['workDay'],
                    "shiftId" => $row['shiftId'],
                    "timeManagementId" => $row['id'],
                    "updateDate" => date("Y-m-d H:i:s"),
                    "updateBy" => $this->model->userId(),
                    "inputDate" => date("Y-m-d H:i:s"),
                    "inputBy" => $this->model->userId(),
                );

                $this->db->insert("salary_time", $insert);
            }



            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE) {
                $error = true;
            }
            $data = array(
                "id" => $id,
                "error" => $error,
                "startDate" => $insertSalary['periodStartDate'],
                "endDate" => $insertSalary['periodEndDate'],
            );



        } else {
            $data = array(
                "error" => true,
            );
        }
        echo json_encode($data);
    }

    function reports($id)
    {
       
        $data = array(
            "item" => $this->model->sql("SELECT s.*, p.name FROM salary as s
            join personal as p on p.id = s.personalId
            where s.presence = 1 and s.id = '$id' ")[0],
            "items1" => $this->model->sql("SELECT * from salary_detail where presence = 1 and (sorting < 200) and salaryId = '$id' "),
            "items2" => $this->model->sql("SELECT * from salary_detail where presence = 1 and (sorting > 200 and sorting < 300 ) and salaryId = '$id' "),
            "items3" => $this->model->sql("SELECT * from salary_detail where presence = 1 and  (sorting > 300 and sorting < 400 ) and  salaryId = '$id' "),
            "salary_time" =>  $this->model->sql("SELECT * FROM salary_time   where  salaryId = '$id' order by date ASC "),

        );
        echo json_encode($data);
    }

    function saleryDetailUpdate()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            $sqlTime = $this->model->sql("SELECT * FROM salary_time  WHERE  salaryId = '".$post['salaryId']."' ORDER BY date ASC "); 
            foreach($sqlTime as $row){
                if($row['late'] != "00:00:00"){
                    $update = array(
                        "amount"    => -1 * (int)$this->model->select("pinaltyFee","potongan_keterlambatan","lateMinute <= '".$row['late']."' ORDER BY lateMinute DESC LIMIT 1"), 
                        "note"      => $this->model->select("note","potongan_keterlambatan","lateMinute <= '".$row['late']."' ORDER BY lateMinute DESC LIMIT 1")
                    );
              
                }else{
                    $update = array(
                        "amount" =>  0, 
                        "note" => "", 
                    );
                }
                $this->db->update("salary_time",$update,"id = ".$row['id']);
            }

          

            foreach ($post['items1'] as $row) {
                $update = array(
                    "value" => $row['value'],
                    "updateDate" => date("Y-m-d H:i:s"),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("salary_detail", $update, "id= '" . $row['id'] . "' ");
            }


            foreach ($post['items2'] as $row) {
                $update = array(
                    "value" => $row['value'],
                    "updateDate" => date("Y-m-d H:i:s"),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("salary_detail", $update, "id= '" . $row['id'] . "' ");
            }

            foreach ($post['items3'] as $row) {
                $update = array(
                    "value" => $row['value'],
                    "updateDate" => date("Y-m-d H:i:s"),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("salary_detail", $update, "id= '" . $row['id'] . "' ");
            }

            $update = array(
                "value" => $this->model->select("sum(amount)","salary_time","salaryId ='".$post['salaryId']."' and presence = 1"  ),
                "updateDate" => date("Y-m-d H:i:s"),
                "updateBy" => $this->model->userId(),
            );
            $this->db->update("salary_detail", $update, "salaryId= '" .$post['salaryId'] . "' and sorting = 302 ");


            $update = array(
                "tunjanganTetap" => $this->model->select("sum(value)", "salary_detail", " presence = 1 and (sorting < 200)  and  salaryId='" . $post['salaryId'] . "' "),
                "tunjanganTidakTetap" => $this->model->select("sum(value)", "salary_detail", " presence = 1 and (sorting > 200 and sorting < 300 ) and  salaryId='" . $post['salaryId'] . "' "),
                "potongan" => $this->model->select("sum(value)", "salary_detail", " presence = 1 and (sorting > 300 and sorting < 400 )  and  salaryId='" . $post['salaryId'] . "' "),
                "takeHomePay" => 0,
                "updateDate" => date("Y-m-d H:i:s"),
                "updateBy" => $this->model->userId(),
            );

            $update['takeHomePay'] = $update['tunjanganTetap'] + $update['tunjanganTidakTetap'] + $update['potongan'];

            $this->db->update("salary", $update, "id= '" . $post['salaryId'] . "' ");


        }
    }
}