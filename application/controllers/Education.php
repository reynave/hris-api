<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Education extends CI_Controller
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
        $personal_education = $this->model->sql("SELECT * from personal_education where presence = 1 and personalId = '$id' order by grade desc");
        $personal_informal_education = $this->model->sql("SELECT * from personal_informal_education where presence = 1 and personalId = '$id' ");
        $personal_experience = $this->model->sql("SELECT * from personal_experience where presence = 1 and personalId = '$id' ");
      
        $i = 0;
        foreach ($personal_education as $row) {
            $personal_education[$i]['grade_label'] = $this->model->select("name", "personal_master_select", "id= '" . $row['grade'] . "' ");
            $i++;
        }

        $data = array(
            "personal_education" => $personal_education,
            "personal_informal_education" => $personal_informal_education, 
            "personal_experience" => $personal_experience, 
            
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array(
            "grade" => $this->model->sql("SELECT *
                from personal_master_select 
                where presence = 1 AND category = 'grade' order by sorting asc
             "),
            "relationship" => $this->model->sql("SELECT * 
                from personal_master_select 
                where presence = 1 AND category = 'relationship'
            "),
        );
        echo json_encode($data);
    }

 

    function onSubmitEducations()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            if ($post['model']['id'] == 0) { 
                $insert = array(
                    "personalId" => $post['personalId'],
                    "grade" => $post['model']['grade'], 
                    "institution" => $post['model']['institution'], 
                    "major" => $post['model']['major'], 
                    "startYear" => $post['model']['startYear'], 
                    "endYear" => $post['model']['endYear'], 
                     
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('personal_education', $insert);
            }else{
                $id = $post['model']['id'];
                $update = array(  
                    "personalId" => $post['personalId'],
                    "grade" => $post['model']['grade'], 
                    "institution" => $post['model']['institution'], 
                    "major" => $post['model']['major'], 
                    "startYear" => $post['model']['startYear'], 
                    "endYear" => $post['model']['endYear'], 
                      
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('personal_education', $update," id = '$id' ");
            }
            $data = array(
                "items" => $post,
            );
        }
        echo json_encode($data);
    }

    function fnDeleteEducation()
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
            $this->db->update('personal_education', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }



    function onSubmitInformalEducations()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            if ($post['model']['id'] == 0) { 
                $insert = array(
                    "personalId" => $post['personalId'],
                    "name" => $post['model']['name'], 
                    "heldBy" => $post['model']['heldBy'],  
                    "startYear" => $post['model']['startYear']['year'] . "-" . $post['model']['startYear']['month'] . "-" . $post['model']['startYear']['day'], 
                    "endYear" => $post['model']['endYear']['year'] . "-" . $post['model']['endYear']['month'] . "-" . $post['model']['endYear']['day'],
                    "fee" => $post['model']['fee'], 
                    "certificate" => $post['model']['certificate'],  
                    
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('personal_informal_education', $insert);
            }else{
                $id = $post['model']['id'];
                $update = array(  
                    "name" => $post['model']['name'], 
                    "heldBy" => $post['model']['heldBy'],  
                    "startYear" => $post['model']['startYear']['year'] . "-" . $post['model']['startYear']['month'] . "-" . $post['model']['startYear']['day'], 
                    "endYear" => $post['model']['endYear']['year'] . "-" . $post['model']['endYear']['month'] . "-" . $post['model']['endYear']['day'],
                    "fee" => $post['model']['fee'], 
                    "certificate" => $post['model']['certificate'],  

                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('personal_informal_education', $update," id = '$id' ");
            }
            $data = array(
                "items" => $post,
            );
        }
        echo json_encode($data);
    }

    function fnDeleteInformalEducation()
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
            $this->db->update('personal_informal_education', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }



    function onSubmitExperience()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            if ($post['model']['id'] == 0) { 
                $insert = array(
                    "personalId" => $post['personalId'],
                    "company" => $post['model']['company'], 
                    "position" => $post['model']['position'],  
                    "startYear" => $post['model']['startYear']['year'] . "-" . $post['model']['startYear']['month'] . "-" . $post['model']['startYear']['day'], 
                    "endYear" => $post['model']['endYear']['year'] . "-" . $post['model']['endYear']['month'] . "-" . $post['model']['endYear']['day'],
                       
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('personal_experience', $insert);
            }else{
                $id = $post['model']['id'];
                $update = array(  
                    "company" => $post['model']['company'], 
                    "position" => $post['model']['position'],  
                    "startYear" => $post['model']['startYear']['year'] . "-" . $post['model']['startYear']['month'] . "-" . $post['model']['startYear']['day'], 
                    "endYear" => $post['model']['endYear']['year'] . "-" . $post['model']['endYear']['month'] . "-" . $post['model']['endYear']['day'],
                
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('personal_experience', $update," id = '$id' ");
            }
            $data = array(
                "items" => $post,
            );
        }
        echo json_encode($data);
    }


    function fnDeleteExperience()
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
            $this->db->update('personal_experience', $update, "id='$id'");

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

}
