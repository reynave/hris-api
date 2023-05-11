<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Tunjangan extends CI_Controller
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
            "items" => $this->model->sql("SELECT * from salary_label where presence = 1  order by sorting ASC "),
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
                "presence" => 0,
            );

            $this->db->update("salary", $update, "id = '$id'");
            $this->db->update("salary_detail", $update, "salaryId = '$id'");
            $this->db->update("salary_time", $update, "salaryId = '$id'");

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

   

    function fnUpdate()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            foreach ($post['items'] as $row) {
                $update = array(
                    "label" => $row['label'],
                    "value" => $row['value'],
                );
                $this->db->update("salary_label", $update, "id=" . $row['id']);
            }

        }
    }

    function fnAdd()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $insert = array(
                "sorting" => $post['item']['sorting'],
                "label" => $post['item']['label'],
                "value" => $post['item']['value'],
                "asCopy" => 1,
                "status" => 0,
                "presence" => 1,

            );
            $this->db->insert("salary_label", $insert);

            $data = array(
                //  "insert" => $insert,
                "post" => $post,
            );
            echo json_encode($data);
        }

    }

    function fnDel()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $update = array(
                "presence" => 0,
            );
            $this->db->update("salary_label", $update, "id=" . $post['id']);

            $data = array(
                "update" => $update,

            );
            echo json_encode($data);
        }
    }

}