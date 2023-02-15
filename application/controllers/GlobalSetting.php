<?php
defined('BASEPATH') or exit('No direct script access allowed');
class GlobalSetting extends CI_Controller
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
            "employment_joblevel" => $this->model->sql("SELECT * FROM employment_joblevel where  presence = 1 order by id ASC "),
            "employment_jobposition" => $this->model->sql("SELECT * FROM employment_jobposition where  presence = 1 order by id ASC "),
            "offtime" => $this->model->sql("SELECT * FROM offtime where  presence = 1 order by id ASC "),
            "reimbursement_name" => $this->model->sql("SELECT * FROM reimbursement_name where  presence = 1 order by id ASC "),
            "time_management_shift" => $this->model->sql("SELECT * FROM time_management_shift where  presence = 1 order by idAuto ASC "),
            "global_setting_jabatan" => $this->model->sql("SELECT * FROM global_setting where  id >= 100 or id <= 199 order by id ASC "),

            "maintenance_equipment" => $this->model->sql("SELECT * FROM maintenance_equipment where  presence = 1 order by id ASC "),
            "maintenance_category" => $this->model->sql("SELECT * FROM maintenance_category where  presence = 1 order by id ASC "),

        );
        echo json_encode($data);
    }

    function fnSave_global_setting_jabatan()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            foreach ($post as $row) {
                $update = array(
                    "value" => $row['value'],
                );
                $this->db->update("global_setting", $update, " id='" . $row['id'] . "' ");
            }

            $data = array(
                "error" => false,
            );
        }

        echo json_encode($data);
    }
    function fnSave_maintenance_equipment()
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
                $this->db->update("maintenance_equipment", $update, " id='" . $row['id'] . "' ");
            }

            $data = array(
                "error" => false,
            );
        }

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

    function fnSave_reimbursement_name()
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
                $this->db->update("reimbursement_name", $update, " id='" . $row['id'] . "' ");
            }

            $data = array(
                "error" => false,
            );
        }

        echo json_encode($data);
    }
    function fnSave_employment_jobposition()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            foreach ($post as $row) {
                $update = array(
                    "name" => $row['name'],
                    "_masterData" => $row['_masterData'],
                    "_timeManagement" => $row['_timeManagement'],
                    "_reimbursement" => $row['_reimbursement'],
                    "_loan" => $row['_loan'],
                    "_payroll" => $row['_payroll'],
                );
                $this->db->update("employment_jobposition", $update, " id='" . $row['id'] . "' ");
            }

            $data = array(
                "error" => false,
            );
        }

        echo json_encode($data);
    }




 







    function fnSave_time_management_shift()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            foreach ($post as $row) {
                if ($this->model->select("id", "time_management_shift", " idAuto='" . $row['idAuto'] . "' ") == "") {
                    $update = array(
                        "id" => $row['id'],
                    );
                    $this->db->update("time_management_shift", $update, " idAuto='" . $row['idAuto'] . "' ");
                }

                $update = array(
                    "name" => $row['name'],
                    "scheduleIn" => $row['scheduleIn'],
                    "scheduleOut" => $row['scheduleOut'],
                    "Sun" => $row['Sun'],
                    "Mon" => $row['Mon'],
                    "Tue" => $row['Tue'],
                    "Wed" => $row['Wed'],
                    "Thu" => $row['Thu'],
                    "Fri" => $row['Fri'],
                    "Sat" => $row['Sat'],
                );
                $this->db->update("time_management_shift", $update, " idAuto='" . $row['idAuto'] . "' ");
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