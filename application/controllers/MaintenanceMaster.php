<?php
defined('BASEPATH') or exit('No direct script access allowed');
class MaintenanceMaster extends CI_Controller
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
            "maintenance_sparepart" => $this->model->sql("SELECT * FROM maintenance_sparepart where  presence = 1 order by id ASC "),
            "maintenance_category" => $this->model->sql("SELECT * FROM maintenance_category where  presence = 1 order by id ASC "), 
        );
        echo json_encode($data);
    }
 

    function fnSave_maintenance_category()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            foreach ($post as $row) {
                $update = array(
                    "name" => $row['name'],
                );
                $this->db->update("maintenance_category", $update, " id='" . $row['id'] . "' ");
            }

            $data = array(
                "error" => false,
            );
        }

        echo json_encode($data);
    }
  
    
    function fnSave_maintenance_sparepart()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            foreach ($post as $row) {
                $update = array(
                    "name" => $row['name'],
                );
                $this->db->update("maintenance_sparepart", $update, " id='" . $row['id'] . "' ");
            }

            $data = array(
                "error" => false,
            );
        }

        echo json_encode($data);
    }
  
    function fnDelete()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        if ($post) {
            $update = array(
                "presence" => 0,
            );
            $this->db->update($post['table'], $update, " id='" . $post['item']['id'] . "' ");

        }
    }

    function fnInsert()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        if ($post) {
            $insert = array(
                "presence" => 1,
            );
            $this->db->insert($post['table'], $insert);
        }
    }
}