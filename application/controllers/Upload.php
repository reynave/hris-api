<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Upload extends CI_Controller
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
      
    }


    function index()
    {
        
         return true;

    }  
    
    function uploadItem()
    { 
        $data = array(
            "error" => true,
        );

        // mysql harus : SET GLOBAL local_infile=1;

        if ($this->input->post('token') == '123') {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/attendance';
            $config['allowed_types']        = 'txt';
            $config['max_size']             = 10000;
            $new_name = time() . $_FILES["item"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('item')) {
                $data['error'] =  $this->upload->display_errors();
            } else {
                $data['upload_data'] =  $this->upload->data();
                $insert = array(
                    "fileSize" => $this->upload->data()['file_size'],
                    "fileName" => $this->upload->data()['file_name'], 
                    "status" => 0,
                    "presence" => 1,
                    "note" => "Upload Success",
                    "inputDate" => date("Y-m-d H:i:s"), 
                );
                $this->db->insert("attendance_log", $insert);
                $id = $this->model->select("id", "attendance_log", "1 order by inputDate DESC limit 1");
                $error = false;
                $data = array(
                    "error"     => $error,
                    "id"        => $id,
                    "insert"    => $insert,
                );
            }
        }

        echo json_encode($data);
    }
 

    function uploadReimbursement()
    { 
        $data = array(
            "error" => true,
        );

        // mysql harus : SET GLOBAL local_infile=1; 
        if ($this->input->post('token') == '2661ef6c07b945d4&') {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/reimbursement';
            $config['allowed_types']        = 'jpg|jpeg|png|pdf';
            $config['max_size']             = 10000;
            $new_name = time() . $_FILES["item"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('item')) {
                $data['error'] =  $this->upload->display_errors();
            } else {
                $data['upload_data'] =  $this->upload->data();  
                $error = false;
                $data = array(
                    "error"     => $error, 
                    "data"    => $data,
                );
            }
        }

        echo json_encode($data);
    }

     
    function sp()
    { 
        $data = array(
            "error" => true,
        );

        // mysql harus : SET GLOBAL local_infile=1; 
        if ($this->input->post('token') == 'W1A5$ftvd147&') {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/sp';
            $config['allowed_types']        = 'jpg|jpeg|png|pdf';
            $config['max_size']             = 10000;
            $new_name = time() . $_FILES["item"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('item')) {
                $data['error'] =  $this->upload->display_errors();
            } else {
                $data['upload_data'] =  $this->upload->data();  
                $error = false;
                $data = array(
                    "error"     => $error, 
                    "data"    => $data,
                );
            }
        }

        echo json_encode($data);
    }
}
