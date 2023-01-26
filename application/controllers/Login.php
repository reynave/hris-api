<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Login extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/javascript');

    }

    function index()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $password = str_replace(["'", '"'], "", $post['passw']);
        $email = $this->model->clean($post['email']);

        $id = $this->model->select('id', 'personal', "email = '" . $email . "' and password = '" . $password . "' and status = 1 and presence =1  ");
        if ($post && $id) {
            $token = 'TT-' . md5($id . '-' . date('YmdHis') . '-' . rand(99999, 999999));
            $insert = array(
                "agent" => $_SERVER['HTTP_USER_AGENT'],
                "token" => $token,
                "client_ip" => $_SERVER['SERVER_ADDR'],
                "personalId" => $id,
                "inputDate" => time(),
            );
            $this->db->insert('personal_access', $insert);
            $data = array(
                "data" => $insert,
                "error" => false,
            );

        } else {
            $data = array(
                "error" => true,
                "post" => $post,
            );
        }

        echo json_encode($data);
    }

    function signout()
    {
        if (!$this->model->header($this->db->openAPI)) {
            echo $this->model->error("Error auth");
            exit;
        }
        $post = json_decode(file_get_contents('php://input'), true);
        if ($post) {
            $this->db->delete("personal_access", "token = '" . $post['token'] . "'");
        }
    }

 

}