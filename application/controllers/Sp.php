<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Sp extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
            //   echo $this->model->error("Error auth");
            //    exit;
        }
    }


    function index()
    {
        $items = $this->model->sql("SELECT id, name  FROM personal WHERE  presence = 1 order by name asc ");
        $i = 0;
        foreach ($items as $row) {
            $items[$i]['qty'] = (int) $this->model->select("count(id)", "personal_sp", " personalId =  '" . $row['id'] . "' and presence = 1 ");

            $i++;
        }

        $data = array(
            "items" => $items,
        );
        echo json_encode($data);
    }


    function detail()
    {
        $id = $this->input->get('id');
        $items = $this->model->sql("SELECT *  FROM personal_sp WHERE  presence = 1 and personalId =  '$id'  ");

        $data = array(
            "personal" => $this->model->sql("SELECT *  FROM personal WHERE  presence = 1 and id =  '$id'  ")[0],
            "items" => $items
        );
        echo json_encode($data);
    }

    function onUpdate()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $error = true;
            foreach ($post['items'] as $row) {
                $update = array(
                    "note" => $row['note'],
                );
                $this->db->update('personal_sp', $update, "id='" . $row['id'] . "'");
            }
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }
    function onUpdateUploadSp()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) { 
           
            $update = array(
                "uploadFile" => $post['uploadFile']['file_name'],
            );
            $this->db->update('personal_sp', $update, "id='" . $post['id'] . "'");
        
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function onAddRow()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            $insert = array(
                "personalId" => $post['personalId'],
                "presence" => 1, 
            );
            $this->db->insert('personal_sp', $insert);

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

     

    function onSubmit()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            for ($i = 0; $i < (int) $post['item']['qty']; $i++) {
                $insert = array(
                    "inventoryId" => $post['inventoryId'],
                    "personalId" => $post['item']['personalId'],
                    "note" => $post['item']['note'],
                    "loanDate" => $post['item']['loanDate']['year'] . "-" . $post['item']['loanDate']['month'] . "-" . $post['item']['loanDate']['day'],
                    "returnDate" => $post['item']['returnDate']['year'] . "-" . $post['item']['returnDate']['month'] . "-" . $post['item']['returnDate']['day'],
                    "rent" => 1,
                    "presence" => 1,
                    "inputDate" => date("Y-m-d H:i:s"),
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert('inventory_personal', $insert);
            }
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function remove()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $update = array( 
                "presence" => 0,
            );
            $this->db->update('personal_sp', $update, "id = '" . $post['item']['id'] . "'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }
}
