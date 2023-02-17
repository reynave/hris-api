<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Maintenance extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
            //   echo $this->model->error("Error auth");
            // exit;
        }
    }

    function index()
    {
        $q = "SELECT m.*, c.name AS 'category'
        FROM maintenance AS m
        left JOIN maintenance_category AS c ON c.id = m.categoryId  
        WHERE m.presence = 1";

        $data = array(
            "q" => $q,
            "data" => $this->model->sql($q),

        );
        echo json_encode($data);
    }

    function select()
    {
        $data = array(
            "equipment" => $this->model->sql("SELECT * from  maintenance_equipment  WHERE  presence = 1"),
            "category" => $this->model->sql("SELECT * from  maintenance_category  WHERE  presence = 1"),
        );
        echo json_encode($data);
    }

    function detail($id = "")
    {
        $q = "SELECT m.*, c.name AS 'category'
        FROM maintenance AS m
        left JOIN maintenance_category AS c ON c.id = m.categoryId 
        WHERE m.presence = 1 and m.id = '" . $id . "' ";

        $item = $this->model->sql($q)[0];

        $schedule = $item['schedule'];

        $time = strtotime($item['purchaseDate']);

        $nextScheduleDate = date("Y-m-d", strtotime("+$schedule month", $time));


        $historyScheduleDate = $this->model->select("scheduleDate", "maintenance_schedule", "presence = 1 AND status = 100 AND maintenanceId = '$id' ORDER BY scheduleDate DESC limit 1");
        if ($historyScheduleDate) {
            $nextScheduleDate = date("Y-m-d", strtotime("+$schedule month", strtotime($historyScheduleDate))); ;
        }



        if (strtotime($nextScheduleDate) <= strtotime($item['warantyUntil'])) {
            $next = array(
                "expired" => false,
                "nextScheduleDate" => $nextScheduleDate,
                "Supplier" => $item['supplier']
            );
        } else {
            $next = array(
                "expired" => true,
            );
        }


        $data = array(
            "nextSchedule" => $next,
            // "equipment" => $this->model->sql("SELECT * from  maintenance_equipment  WHERE  presence = 1"),
            "category" => $this->model->sql("SELECT * from  maintenance_category  WHERE  presence = 1"),
            "item" => $item,
            "images" => $this->model->sql("SELECT * from  maintenance_images  WHERE  presence = 1 and maintenanceId = '" . $id . "'"),
            "schedule" => $this->model->sql("SELECT m.*, s.name AS 'statusName' 
                FROM  maintenance_schedule  AS m
                JOIN maintenance_status AS s ON m.`status` = s.id
                WHERE  m.presence = 1 and m.maintenanceId = '" . $id . "' 
                ORDER BY m.scheduleDate DESC
            "),
        );
        echo json_encode($data);
    }

    function insert()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            $id = $this->model->number('maintenance', date('y'));

            // $equipmentId = 0;
            // if ($post['insertEquipment'] != "") {
            //     $insert2 = array(
            //         "name" => $post['insertEquipment'],
            //         "inputDate" => date("Y-m-d H:i:s")
            //     );
            //     $this->db->insert("maintenance_equipment", $insert2);
            //     $equipmentId = $this->model->select("id", "maintenance_equipment", " 1 ORDER BY inputDate DESC limit 1 ");
            // }

            $categoryId = 0;
            if ($post['insertCategory'] != "") {
                $insert3 = array(
                    "name" => $post['insertCategory'],
                    "inputDate" => date("Y-m-d H:i:s")
                );
                $this->db->insert("maintenance_category", $insert3);
                $categoryId = $this->model->select("id", "maintenance_category", " 1 ORDER BY inputDate DESC limit 1 ");
            }

            $error = true;
            $purchaseDate = $post['item']['purchaseDate']['year'] . "-" . $post['item']['purchaseDate']['month'] . "-" . $post['item']['purchaseDate']['day'];
            $warantyUntil = $post['item']['warantyUntil']['year'] . "-" . $post['item']['warantyUntil']['month'] . "-" . $post['item']['warantyUntil']['day'];

            $insert = array(
                "id" => $id,
                "warantyUntil" => $warantyUntil,
                "equipment" => $post['item']['equipment'],
                "purchaseDate" => $purchaseDate,
                "location" => $post['item']['location'],
                //  "equipmentId" => $post['insertEquipment'] ? $equipmentId : $post['item']['equipmentId'],
                "categoryId" => $post['insertCategory'] ? $categoryId : $post['item']['categoryId'],
                "description" => $post['item']['description'],
                "supplier" => $post['item']['supplier'],
                "schedule" => $post['item']['schedule'],

                "inputDate" => date("Y-m-d H:i:s"),
                "inputBy" => $this->model->userId(),

            );
            $this->db->insert("maintenance", $insert);

            $data = array(
                "error" => false,
                "id" => $id,
            );
            echo json_encode($data);
        }

    }

    function update()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $purchaseDate = $post['item']['purchaseDate']['year'] . "-" . $post['item']['purchaseDate']['month'] . "-" . $post['item']['purchaseDate']['day'];
            $warantyUntil = $post['item']['warantyUntil']['year'] . "-" . $post['item']['warantyUntil']['month'] . "-" . $post['item']['warantyUntil']['day'];

            $update = array(
                "warantyUntil" => $warantyUntil,
                "purchaseDate" => $purchaseDate,
                "location" => $post['item']['location'],
                "equipment" => $post['item']['equipment'],
                "description" => $post['item']['description'],
                "categoryId" => $post['item']['categoryId'],
                "supplier" => $post['item']['supplier'],
                "schedule" => $post['item']['schedule'],

                "updateDate" => date("Y-m-d H:i:s"),
                "updateBy" => $this->model->userId(),
            );
            $this->db->update("maintenance", $update, "id='" . $post['id'] . "'");

            $data = array(
                "error" => false,
            );
            echo json_encode($data);
        }

    }

    function fnDeleteTrans()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $update = array(
                "presence" => 0,
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update("maintenance_schedule", $update, "id='" . $post['item']['id'] . "'");

            $data = array(
                "error" => false,
            );
            echo json_encode($data);
        }

    }

    function fnDoneTrans()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $scheduleDetailDate = $post['scheduleDetailDate']['year'] . "-" . $post['scheduleDetailDate']['month'] . "-" . $post['scheduleDetailDate']['day'];

            $update = array(
                "cost" => $post['item']['cost'],
                "supplier" => $post['item']['supplier'],
                "note" => $post['item']['note'],
                "scheduleDate" => $scheduleDetailDate,
                "maintenanceDate" => date("Y-m-d"),
                "status" => 100,
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update("maintenance_schedule", $update, "id='" . $post['item']['id'] . "'");

            $warantyUntil = $this->model->select("warantyUntil", "maintenance", "id='" . $post['id'] . "'");
            $schedule = $this->model->select("schedule", "maintenance", "id='" . $post['id'] . "'");



            $time = strtotime($scheduleDetailDate);
            $final = date("Y-m-d", strtotime("+$schedule month", $time));

            if (strtotime($final) <= strtotime($warantyUntil)) {


                $id = $this->model->number('mlog', date('yd'));
                $insert = array(
                    "id" => $id,
                    "maintenanceId" => $post['id'],
                    "scheduleDate" => $final,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "inputBy" => $this->model->userId(),
                );
                $this->db->insert("maintenance_schedule", $insert);
            }

            $data = array(
                "error" => false,
            );

            echo json_encode($data);
        }

    }

    function fnAddTrans()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $id = $this->model->number('mlog', date('yd'));
            $error = true;
            $scheduleDate = $post['item']['scheduleDate']['year'] . "-" . $post['item']['scheduleDate']['month'] . "-" . $post['item']['scheduleDate']['day'];

            $insert = array(
                "id" => $id,
                "maintenanceId" => $post['id'],
                "scheduleDate" => $scheduleDate,
                "cost" => $post['item']['cost'],
                "note" => $post['item']['note'],
                "supplier" => $post['item']['supplier'],
                "inputDate" => date("Y-m-d H:i:s"),
                "inputBy" => $this->model->userId(),
            );
            $this->db->insert("maintenance_schedule", $insert);

            $data = array(
                "error" => false,
                "id" => $id,
            );
            echo json_encode($data);
        }

    }


    function schedule()
    {
        $data = array(
            "data" => $this->model->sql("SELECT s.*, m.supplier, c.name AS 'category' 
            FROM maintenance_schedule AS s
            JOIN maintenance AS m ON m.id = s.maintenanceId
            left JOIN maintenance_category AS c ON c.id = m.categoryId 
            WHERE s.presence = 1 AND s.`status` = 1
            
            "),
        );
        echo json_encode($data);
    }

}