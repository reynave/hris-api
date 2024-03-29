<?php
defined('BASEPATH') or exit('No direct script access allowed');
class TimeManagementHoliday extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        if (!$this->model->header($this->db->openAPI)) {
            // echo $this->model->error("Error auth");
            // exit;
        }
    }


    function index()
    {
        $id = $this->model->userId();
        $data = array(
            "data" => $this->model->sql("SELECT h.* , p.name 
                FROM request_holiday AS h
                LEFT JOIN personal AS p ON  p.id = h.approvedBy
                WHERE h.personalId = '$id' 
                AND h.presence = 1 
            "),
        );
        echo json_encode($data);
    }


    function select()
    {
        $data = array(
            "selectShift" => $this->model->sql("SELECT *
                FROM time_management_shift 
            "),
            "personal" => $this->model->sql("SELECT id, name from personal where presence = 1 and id = '" . $this->model->userId() . "' order by name ASC"),

        );
        echo json_encode($data);
    }


    function fnDelete()
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
            $this->db->update('time_management', $update, "id='$id' and approved = 0");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function onSubmitModel()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;

            // Tanggal start dan end
            $startDate = $post['startDate']['year'] . "-" . $post['startDate']['month'] . "-" . $post['startDate']['day'];
                
            $endDate = $post['endDate']['year'] . "-" . $post['endDate']['month'] . "-" . $post['endDate']['day'];

            // Konversi string tanggal menjadi objek DateTime
            $start = new DateTime($startDate);
            $end = new DateTime($endDate);

            // Tambahkan 1 hari ke tanggal end untuk mengikutsertakan tanggal tersebut
            $end->modify('+1 day');

            // Loop untuk menghasilkan tanggal-tanggal di antara dua tanggal
            $dateRange = [];
            while ($start < $end) {
                $dateRange[] = $start->format('Y-m-d');
                $start->modify('+1 day');
            }

            // Tampilkan hasil
            if(count( $dateRange) < 14) {
                foreach( $dateRange as $row){
                    $insert = array(
                        "personalId" => $post['personalId'], 
                        "shiftId" => $post['shiftId'], 
                        "note" => $post['note'], 
                        "approved" => 0,  
                        "date" => $row,
                        "presence" => 1,
                        "inputDate" => date("Y-m-d H:i:s"),
                        "updateDate" => date("Y-m-d H:i:s"),
                    );
                    $this->db->insert('request_holiday', $insert);
                }
            }
            $data = array(
                "error" => false,
                "dateRange" => $dateRange ,
            );
        }
        echo json_encode($data);
    }
}