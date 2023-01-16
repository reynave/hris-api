<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Admin extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->key = $this->db->key;
        $this->openAPI = $this->db->openAPI;
        header('Access-Control-Allow-Origin: *');

        //header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        header("Access-Control-Allow-Headers: key, token,  Content-Type");

        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/javascript');
        // error_reporting(E_ALL);
        date_default_timezone_set('Asia/Jakarta');
        $this->db->query("SET time_zone = '+07:00'");
        //  $this->core->https();

        if (!$this->model->header($this->openAPI)) {
            echo $this->model->error("Error auth");
            exit;
        }
        
        if (!$this->model->access_right('admin')) {
            echo $this->model->error("You dont have access!");
            exit;
        }
    }

    function index()
    {
        $data = array(
           
            "admin" =>  $this->model->sql(" SELECT u.id, u.name, u.email, u.phone, u.lastLogin, u.STATUS, a.name as access
            from user AS u
            JOIN user_access AS a ON a.id = u.id_user_access
            where id_user_access > 9000
            "),

            "user_access" =>  $this->model->sql(" SELECT *  FROM user_access where id > 9000 order by id ASC"), 
        );
        echo   json_encode($data);
    }
  
 

    function create()
    {
        $sendEmail = false;
        $data = array(
            "error" => true,
            "user" => [],
        );
        $post = json_decode(file_get_contents('php://input'), true);
        if ($post) {
            if ($post['email']  && $this->model->select("id", "user", "email = '" . $post['email'] . "'") === null) {
                $this->db->trans_start();
                $password = rand(100000, 999999);
                if ($post['type'] > 99)  { // ccreate admin
                    $id = $this->model->number("admin");

                    $user = array(
                        "id"                => $id,
                        "id_parent"         => 0,
                        "id_binary_parent"  => 0,
                        'id_user_access'    => $post['type'],
                        "password"          => md5($password),
                        "status"            => 1,
                        "presence"          => 1,
                        "name"  => $post['name'],
                        "phone" => $post['phone'],
                        "email" => $post['email'],
                        "register_date" =>  date("Y-m-d H:i:s"),
                        "upgrade_expired" => '2000-01-01',
                        "expires_date" => '2000-01-01',

                        "input_date" => date("Y-m-d H:i:s"),
                        "input_by" => $this->model->userId(),
                        "update_date" => date("Y-m-d H:i:s"),
                        "update_by" => $this->model->userId(),
                    );
                    $this->db->insert("user", $user);
                    $email = array(
                        "to"        => $post['email'],
                        "subject"   => "New admin kitaro21.org login",
                        "message"   => "
                        Email       : " . $post['email'] . "   <br>                    
                        Password    : $password              <br>              
                        ",

                    );
                    $sendEmail = $this->model->sendMail($email);
                }

 

                $this->db->trans_complete();


                if ($this->db->trans_status() === FALSE) {
                    $data = array(
                        "error" => false,
                        "user" =>  $user,
                        "note" => "trans_status ERROR",
                        "sendEmail" =>   $sendEmail,
                    );
                } else {
                    $data = array(
                        "error" => false,
                        "user" =>  $user,
                        "sendEmail" =>   $sendEmail,
                    );
                }
            } else {
                $data = array(
                    "error" => true,
                    "user" => [],
                    "note" =>  "Duplicate email",
                    "post" => $post,
                );
            }
        }
        echo json_encode($data);
    }

    function access()
    {
        $data = array(
            "error" => true,
            "user" => [],
        );
        $post = json_decode(file_get_contents('php://input'), true);
        if ($post) {
            $token = "Temp" . md5($this->model->userId() . '-' . date('YmdHis') . '-' . rand(99999, 999999));
            $user = array(
                "id_user" => $post['id'],
                "token" =>  $token,
                "device" => "admin",
                "requestKey" => md5($this->model->userId() . rand(99999, 999999)),
                "agent" => $_SERVER['HTTP_USER_AGENT'],
                "input_date" => date("Y-m-d H:i:s"),
                "input_by" => $this->model->userId(),
                "update_date" => date("Y-m-d H:i:s"),
                "update_by" => $this->model->userId(),
            );
            $this->db->insert("user_auth", $user);

            $data = array(
                "error" => true,
                "user" =>  $user,
            );
        }

        echo json_encode($data);
    }

     
     
}
