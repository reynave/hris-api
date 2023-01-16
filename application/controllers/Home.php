<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{

    public function __construct()
    {
        parent::__construct(); 
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        /*if (!$this->model->header($this->openAPI)) {
            echo $this->model->error("Error auth");
            exit;
        }*/
    }


    public function index()
    { 
        $data = array(
            "error" => false,
            "ServerTime" => date("Y-m-d H:i:s"), 
           //  "itemUomId" =>$this->model->sql("select  id,description from cso1_itemUom where presence = 1 order by ID"),
           //  "itemCategoryId" =>$this->model->sql("select  id, name from cso1_itemCategory where presence = 1 order by ID"), 
           //  "itemTaxId" =>$this->model->sql("select  id, name from cso1_taxCode where presence = 1 order by ID"), 
              
        );

        echo json_encode($data,JSON_PRETTY_PRINT);
    } 
   
}
