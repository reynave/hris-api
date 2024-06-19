<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Inventory extends CI_Controller
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
        $items = $this->model->sql("SELECT *  FROM inventory WHERE  presence = 1 ");
        // $i = 0;
        // foreach($items as $row){
        //     $items[$i]['rent'] = 0;
        //     if($this->model->select("rent", "inventory_personal"," inventoryId =  '". $row['id']."' and presence = 1 " )){
        //         $items[$i]['rent'] =  (int)$this->model->select("rent", "inventory_personal"," inventoryId =  '". $row['id']."' and presence = 1 " );
        //     } 
        //     $items[$i]['stock'] =  $row['qty'] - $items[$i]['rent'] ;
        //     $i++;
        // }

        $data = array(
            "items" => $items,
        );
        echo json_encode($data);
    }


    function detail()
    {
        $id = $this->input->get('id');
        $item = $this->model->sql("SELECT *  FROM inventory WHERE  presence = 1 and id =  '$id'  ");
        $personal = $this->model->sql("SELECT id, name  FROM personal WHERE  presence = 1 order by name ASC");

        $data = array(
            "header" => $item[0],
            "personal" => $personal,
            "items" => $this->model->sql("SELECT 
            i.id, i.personalId , p.`name` , i.note, i.returnDate, i.loanDate, i.rent
            FROM inventory_personal AS i
            left join personal as p on P.id = i.personalId
            WHERE i.presence = 1 and i.inventoryId =  '$id' 
        "),
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
                    "endDate" => $row['endDate'],
                    "createDate" => $row['createDate'],
                    "status" => $row['status'],
                );
                $this->db->update('announcement', $update, "id='" . $row['id'] . "'");
            }
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
                "rent" => 0,
                "presence" => 0,
            );
            $this->db->update('inventory_personal', $update, "id = '" . $post['item']['id'] . "'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }
}
