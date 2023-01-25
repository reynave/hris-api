<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Organization extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        /* if (!$this->model->header($this->openAPI)) {
             echo $this->model->error("Error auth");
            exit;
        }*/
    }


    function index()
    {
        $data =  [];
        foreach($this->model->sql("SELECT  * FROM organization WHERE  presence = 1 order by name ASC ") as $row){
            $temp = array(
                "id" => $row['id'],
                "name" => $row['name'],
                "branch" => $this->model->sql("SELECT  * FROM branch WHERE organizationId ='".$row['id']."' and presence = 1 order by name ASC "),
            );
            array_push($data,$temp);
        };

        $data = array(
            "items" => $data,
        );
        echo json_encode($data);
    }
 
    function fnUpdate(){
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $update = array(
                "name" => $post['data']['name']
            );
            $this->db->update($post['table'], $update, " id = '" . $post['data']['id'] . "' ");
            $data = array(
                "error" => false, 
            );
            echo json_encode($data);
        }
    }
    function fnDelete(){
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $update = array(
                "presence" => 0
            );
            $this->db->update($post['table'], $update, " id = '" . $post['data']['id'] . "' ");
            $data = array(
                "error" => false, 
            );
            echo json_encode($data);
        }
    }

    function branch($id){
        $data = array(
            "data" => $this->model->sql("select * from branch where organizationId = $id and presence = 1 "),
        );
        echo json_encode($data);
    }
}
