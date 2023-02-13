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
        $q = "SELECT m.*, c.name AS 'category', e.name AS 'equipment'
        FROM maintenance AS m
        left JOIN maintenance_category AS c ON c.id = m.categoryId
        left JOIN maintenance_equipment AS e ON e.id = m.equipmentId
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
        $q = "SELECT m.*, c.name AS 'category', e.name AS 'equipment'
        FROM maintenance AS m
        left JOIN maintenance_category AS c ON c.id = m.categoryId
        left JOIN maintenance_equipment AS e ON e.id = m.equipmentId
        WHERE m.presence = 1 and m.id = '" . $id . "' ";

        $data = array(
            "equipment" => $this->model->sql("SELECT * from  maintenance_equipment  WHERE  presence = 1"),
            "category" => $this->model->sql("SELECT * from  maintenance_category  WHERE  presence = 1"),
            "item" => $this->model->sql($q)[0],
            "images" => $this->model->sql("SELECT * from  maintenance_images  WHERE  presence = 1 and maintenanceId = '" . $id . "'"), 
            "schedule" => $this->model->sql("SELECT m.*, s.name AS 'statusName' 
            FROM  maintenance_schedule  AS m
            JOIN maintenance_status AS s ON m.`status` = s.id
            WHERE  m.presence = 1 and m.maintenanceId = '" . $id . "'"),
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
            $error = true;
            $purchaseDate = $post['item']['purchaseDate']['year'] . "-" . $post['item']['purchaseDate']['month'] . "-" . $post['item']['purchaseDate']['day'];
            $warantyUntil = $post['item']['warantyUntil']['year'] . "-" . $post['item']['warantyUntil']['month'] . "-" . $post['item']['warantyUntil']['day'];

            $insert = array(
                "id" => $id,
                "warantyUntil" => $warantyUntil,
                "purchaseDate" => $purchaseDate,
                "location" => $post['item']['location'],
                "equipmentId" => $post['item']['equipmentId'],
                "description" => $post['item']['description'],
                "categoryId" => $post['item']['categoryId'],
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
                "equipmentId" => $post['item']['equipmentId'],
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
            $update = array(
                "status" => 100,
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update("maintenance_schedule", $update, "id='" . $post['item']['id'] . "'");

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

}