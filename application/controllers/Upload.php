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
         return false;
    }  
    function accountImg(){
        $data = array(
            "error" => true, 
        );
        if($this->input->post('token') ) {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/configuration/';
            $config['allowed_types']        = 'gif|jpg|png|jpeg';
            $config['max_size']             = 2000;
            $config['max_width']            = 5024;
            $config['max_height']           = 3768;
            $new_name = time().$_FILES["thumbnail"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);
           
            if (!$this->upload->do_upload('thumbnail')) { 
                $data['error'] =  $this->upload->display_errors();
            }
            else {  
                $data['upload_data'] =  $this->upload->data(); 
                $update = array(
                    "name" => "Logo",
                    "value"=> $this->upload->data()['file_name'],
                    "updateDate" => time(),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("cso1_account", $update,"id=14" );

            } 

        }
     
        echo json_encode($data);
    }

    function configurationImg(){
        $data = array(
            "error" => true, 
        );
        if($this->input->post('token') ) {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/configuration/';
            $config['allowed_types']        = 'gif|jpg|png|jpeg';
            $config['max_size']             = 2000;
            $config['max_width']            = 5024;
            $config['max_height']           = 3768;
            $new_name = time().$_FILES["thumbnail"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);
           
            if (!$this->upload->do_upload('thumbnail')) { 
                $data['error'] =  $this->upload->display_errors();
            }
            else {  
                $data['upload_data'] =  $this->upload->data(); 
                $update = array(
                    "name" => "configurationImages",
                    "value"=> $this->upload->data()['file_name'],
                    "updateDate" => time(),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("cso1_account", $update,"id=1010" );

            } 

        }
     
        echo json_encode($data);
    }

    function uploadImages(){
        $data = array(
            "error" => true, 
        );
        if($this->input->post('token') ) {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/account/';
            $config['allowed_types']        = 'gif|jpg|png|jpeg';
            $config['max_size']             = 2000;
            $config['max_width']            = 5024;
            $config['max_height']           = 3768;
            $new_name = time().$_FILES["thumbnail"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);
           
            if (!$this->upload->do_upload('thumbnail')) { 
                $data['error'] =  $this->upload->display_errors();
            }
            else {  
                $data['upload_data'] =  $this->upload->data(); 
                $update = array(
                    "name" => "Logo Images SCO Terminal",
                    "value"=> $this->upload->data()['file_name'],
                    "updateDate" => time(),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("cso1_account", $update,"id=14" );

            } 

        }
     
        echo json_encode($data);
    }

    function uploadItems(){
        $data = array(
            "error" => true, 
        );
        if( $this->input->post('token') ) {
            $this->load->helper('url', 'form');
            $config['upload_path']          = './uploads/items/';
            $config['allowed_types']        = 'gif|jpg|png|jpeg';
            $config['max_size']             = 2000;
            $config['max_width']            = 5024;
            $config['max_height']           = 3768;
            $new_name = time().$_FILES["thumbnail"]['name'];
            $config['file_name'] = $new_name;
            $data = array(
                "error" => false,
                "upload_data" => [],
                "token" => apache_request_headers(),
                "post" => $this->input->post(),
            );
            $this->load->library('upload', $config);
           
            if (!$this->upload->do_upload('thumbnail')) { 
                $data['error'] =  $this->upload->display_errors();
            }
            else {  
                $data['upload_data'] =  $this->upload->data(); 
                $update = array( 
                    "images"=> base_url()."uploads/items/".$this->upload->data()['file_name'],
                    "updateDate" => time(),
                    "updateBy" => $this->model->userId(),
                );
                $this->db->update("cso1_item", $update,"id='".$this->input->post('id')."' " );

            } 

        }
     
        echo json_encode($data);
    }
}
