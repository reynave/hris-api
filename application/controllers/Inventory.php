<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Inventory extends CI_Controller
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
            "items" => $this->model->sql("SELECT * FROM inventory WHERE  presence = 1 "),
        );
        echo json_encode($data);
    }


    function onUpdate()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            foreach ($post['items'] as $row) {
                $update = array(
                    "note" => $row['note'],
                    "endDate" => $row['endDate'],
                    "createDate" => $row['createDate'],
                    "status" => $row['status'],
                );
                $this->db->update('announcement', $update, "id='" . $row['id'] . "'");
            }
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }


    function addRow()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $insert = array(
                "note" => "New " . date("Y-m-d H:i:s"),
            );
            $this->db->insert('announcement', $insert);

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function fnDelete()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $update = array(
                "presence" => 0, 
            );
            $this->db->update('announcement', $update, "id='" . $post['item']['id'] . "'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }
}
