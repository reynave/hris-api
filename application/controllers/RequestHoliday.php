<?php
defined('BASEPATH') or exit('No direct script access allowed');
class RequestHoliday extends CI_Controller
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

    function waitingApproved()
    {

        $data = $this->model->sql("SELECT personalId, COUNT(id) AS 'totalDays' 
        FROM request_holiday 
        WHERE approved = 0 and presence = 1
        GROUP BY personalId 
        ");
        $i = 0;
        foreach ($data as $row) {
            $data[$i]['name'] = $this->model->select("name", "personal", " id = '" . $row['personalId'] . "'");
            $data[$i]['inputDate'] = $this->model->select("inputDate", "personal", " id = '" . $row['personalId'] . "'");

            $i++;
        }

        $data = array(
            "data" => $data,
        );
        echo json_encode($data);
    }

    function detailRequest()
    {
        $id = $this->input->get('id');
        $data = array(
            "items" => $this->model->sql("SELECT h.*, s.name AS 'shiftName', '' AS 'check'
            FROM request_holiday AS h
            LEFT JOIN time_management_shift AS s ON s.id = h.shiftId
            WHERE h.approved = 0 and h.presence = 1  and  h.personalId = '$id'
            ORDER BY h.date ASC
            ")
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
            if (count($dateRange) < 14) {
                foreach ($dateRange as $row) {
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
                "dateRange" => $dateRange,
            );
        }
        echo json_encode($data);
    }


    function fnApprove()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $this->model->userId();
            foreach ($post['items'] as $row) {
                $update = array(
                    "approved" => $post['approved'],
                    "approvedBy" => $post['approved'],
                    "approvedDate" => date("Y-m-d H:i:s"),
                    
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                if ($row['check'] == true) {
                    $this->db->update('request_holiday', $update, "id='" . $row['id'] . "' ");


                    $totalHoliday = (int) $this->model->select("totalHoliday","employment","personalId = '" .$row['personalId']. "' ") + 1;
                    $update = array(
                        'totalHoliday' => $totalHoliday 
                    ); 
                    $this->db->update('employment', $update, "personalId = '" .$row['personalId']. "' ");
                }

            }

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function historyRequestHoliday()
    {
        $id = $this->input->get('id');
        $data = array(
            "data" => $this->model->sql("SELECT h.*, s.name AS 'shiftName', p.name AS 'personal'
            FROM request_holiday AS h
            LEFT JOIN time_management_shift AS s ON s.id = h.shiftId
            LEFT JOIN personal AS p ON p.id = h.personalId
            WHERE h.approved != 0 and h.presence = 1  
            ")
        );
        echo json_encode($data);
    }
}