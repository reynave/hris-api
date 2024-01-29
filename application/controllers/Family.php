<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Family extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
            //    echo $this->model->error("Error auth");
            //    exit;
        }
    }

    function index($id)
    {
        $items = $this->model->sql("SELECT * from personal_family where presence = 1 and personalId = '$id' ");
        $i = 0;
        foreach ($items as $row) {
            $items[$i]['relationship_label'] = $this->model->select("name", "personal_master_select", "id= '" . $row['relationship'] . "' ");
            $items[$i]['maritalStatus_label'] = $this->model->select("name", "personal_master_select", "id= '" . $row['maritalStatus'] . "' ");
            $items[$i]['gender_label'] = $items[$i]['gender'] == 'm' ? "Male" : "Female";
            $i++;
        }

        $itemsEC = $this->model->sql("SELECT * from personal_family where presence = 1 and personalId = '$id' and asEmergencyContact = 1");
        $i = 0;
        foreach ($itemsEC as $row) {
            $itemsEC[$i]['relationship_label'] = $this->model->select("name", "personal_master_select", "id= '" . $row['relationship'] . "' ");
            $itemsEC[$i]['maritalStatus_label'] = $this->model->select("name", "personal_master_select", "id= '" . $row['maritalStatus'] . "' ");
            $itemsEC[$i]['gender_label'] = $itemsEC[$i]['gender'] == 'm' ? "Male" : "Female";
            $i++;
        }

        $data = array(
            "items" => $items,
            "itemsEC" => $itemsEC,
            
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array(
            "maritalStatus" => $this->model->sql("SELECT *
                from personal_master_select 
                where presence = 1 AND category = 'maritalStatus'
             "),
            "relationship" => $this->model->sql("SELECT * 
                from personal_master_select 
                where presence = 1 AND category = 'relationship'
            "),
        );
        echo json_encode($data);
    }


    function fnSave()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;

            $id = $post['id'];
            $update = array(
                "permanent" => $post['model']['permanent'],
                "idx" => $post['model']['idx'],
                "name" => $post['model']['name'],
                "phone" => $post['model']['phone'],
                "email" => $post['model']['email'],
                "birthPlace" => $post['model']['birthPlace'],
                "birthDate" => $post['model']['birthDate']['year'] . "-" . $post['model']['birthDate']['month'] . "-" . $post['model']['birthDate']['day'],
                "gender" => $post['model']['gender'],
                "marital" => $post['model']['marital'],
                "blood" => $post['model']['blood'],
                "religion" => $post['model']['religion'],
                "idType" => $post['model']['idType'],
                "idNumber" => $post['model']['idNumber'],
                "expDate" => $post['model']['expDate']['year'] . "-" . $post['model']['expDate']['month'] . "-" . $post['model']['expDate']['day'],
                "postalCode" => $post['model']['postalCode'],
                "address" => $post['model']['address'],

                "inputDate" => date("Y-m-d H:i:s"),
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update('personal', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }


    function onSubmit()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            if ($post['model']['id'] == 0) { 
                $insert = array(
                    "personalId" => $post['personalId'],
                    "name" => $post['model']['name'],
                    "dateOfBirth" => $post['model']['dateOfBirth']['year'] . "-" . $post['model']['dateOfBirth']['month'] . "-" . $post['model']['dateOfBirth']['day'],
                    "gender" => $post['model']['gender'] == 'm' ? 'm' : 'f',
                    "relationship" => $post['model']['relationship'],
                    "job" => $post['model']['job'],
                    "maritalStatus" => $post['model']['maritalStatus'],
                    "ktpId" => $post['model']['ktpId'],
                    "address" => $post['model']['address'],
                    "phone" => $post['model']['phone'],
                    "asEmergencyContact" => $post['model']['asEmergencyContact'],
                    
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('personal_family', $insert);
            }else{
                $id = $post['model']['id'];
                $update = array(  
                    "name" => $post['model']['name'],
                    "dateOfBirth" => $post['model']['dateOfBirth']['year'] . "-" . $post['model']['dateOfBirth']['month'] . "-" . $post['model']['dateOfBirth']['day'],
                    "gender" => $post['model']['gender'] == 'm' ? 'm' : 'f',
                    "relationship" => $post['model']['relationship'],
                    "job" => $post['model']['job'],
                    "maritalStatus" => $post['model']['maritalStatus'],
                    "ktpId" => $post['model']['ktpId'],
                    "address" => $post['model']['address'],
                    "phone" => $post['model']['phone'],
                    "asEmergencyContact" => $post['model']['asEmergencyContact'],
                    
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('personal_family', $update," id = '$id' ");
            }
            $data = array(
                "items" => $post,
            );
        }
        echo json_encode($data);
    }

    function fnDelete()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $id = $post['id'];
            $update = array(
                "presence" => 0,  
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update('personal_family', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }


}
