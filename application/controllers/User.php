<?php
defined('BASEPATH') or exit('No direct script access allowed');
class User extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();  
        $this->openAPI = $this->db->openAPI;
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        if (!$this->model->header($this->openAPI)) {
            echo $this->model->error("Error auth");
             exit;
        }
    }


    function index()
    { 
      
        $data = array(
            "items" => $this->model->sql("SELECT * from cso1_user where presence = 1"), 
            "userAccess" =>  $this->model->sql("SELECT *  FROM cso1_userAccess   order by name ASC"), 
        ); 
        echo   json_encode($data);
    }
     
    function insert()
    { 
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $insert = array( 
                "name" => time(),
                "email" => "user_".time(),
                "status" => 0, 
                "presence" => 1,
                "userAccessId" => 1,
                "inputDate" => time(),
                "inputBy" => $this->model->userId(),
                "updateDate" => time(),
                "updateBy" => $this->model->userId(), 
            );
            $this->db->insert('cso1_user', $insert); 
            $data = array(
                "items" =>  $insert,
            );
        }
        echo   json_encode($data);
    }

    function update()
    { 
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $update = array(
                "name" =>  $post['item']['name'],   
                "email" =>  !$post['item']['email']? "User@".time().rand(1000,9999) : $post['item']['email'],   
                "userAccessId" => $post['item']['userAccessId'],   
                "status" => $post['item']['status'],   
                "updateDate" => time(),
                "updateBy" => $this->model->userId(), 
            );
            $this->db->update('cso1_user', $update,"id = ".$post['item']['id']);

            $data = array(
                "items" =>  $post,
            );
            echo   json_encode($data);
        }
       
    }

    function delete()
    { 
      
            $post =   json_decode(file_get_contents('php://input'), true);
            $error = true;
            if ($post) {
                $error = true;
                $update = array(
                    "email" => "del".time().rand(1000,9999),
                    "presence" => 0,  
                    "updateDate" => time(),
                    "updateBy" => $this->model->userId(), 
                );
                $this->db->update('cso1_user', $update,"id = ".$post['item']['id']);

                $data = array(
                    "items" =>  $update,
                );
            }
            echo   json_encode($data);
     
    }
 
    function userAccess()
    { 
        $userAccess = $this->model->sql("SELECT * from cso1_userAccess order by name ASC");
        $item = [];
        foreach ($userAccess as $r ) {
            $temp = [
                "id" => $r['id'],
                "name" => $r['name'],
                "access" => $this->model->sql("SELECT * from cso1_userAccessModule where userAccessId = ".$r['id']." order by module ASC"),
            ];
           array_push($item , $temp);
        }

        $data = array(
            "items" => $item,  
        ); 
        echo   json_encode($data);
    }

    function userAccessUpdate(){
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $update = array(
                "_access" =>  $post['_access'],   
                "_modify" => $post['_modify'],    
            );
            $this->db->update('cso1_userAccessModule', $update,"id = ".$post['id']);

            $data = array(
                "items" =>  $post,
            );
            echo   json_encode($data);
        } 
    }
     
    function header(){
        $userId = $this->model->select("userId","cso1_userAuth","token='". $this->input->get('t')."'" );
        $userAccessId = $this->model->select("userAccessId","cso1_user","id='". $userId."'" );
       
        $data = array(
            "get" =>  $this->input->get(),
            "access" => $this->model->select("id","cso1_userAuth","token='". $this->input->get('t')."'" ) ? true : false,
            "user" => array(
                "name" => ucwords($this->model->select("name","cso1_user","id='$userId'" )),
                "id" =>  $userId,
                "access" => ucwords($this->model->select("name","cso1_userAccess","id=".$userAccessId )),
                
            )
          //  "userAuth" => $this->model->sql("select * from cso1_userAuth where token='". $this->input->get('t')."' " )[0],
            
        );
        echo   json_encode($data); 
    }
}
