<?php
defined('BASEPATH') or exit('No direct script access allowed');
class TimeManagement extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        /* if (!$this->model->header($this->openAPI)) {
             echo $this->model->error("Error auth");
            exit;
        }*/
    }


    function index()
    {
        $data = array(
            "data" => $this->model->sql("SELECT p.id , p.name , t2.*
            FROM personal AS p
            LEFT JOIN  (
                SELECT tm.personalId, tm.`date`, s.name AS 'shift',
                s.scheduleIn, s.scheduleOut,
                 tm.checkIn, tm.checkOut, tm.overTime, tm.id as 'idx'
                
                FROM time_management AS tm 
                LEFT JOIN time_management_shift AS s ON tm.shiftId = s.id
                
                WHERE  tm.`date` = CURDATE() and tm.presence = 1
             ) AS  t2 ON p.id = t2.personalId
            
            WHERE p.presence = 1;
             "),
        );
        echo json_encode($data);
    }

    function today($id)
    {
 
        $sql = "SELECT * From time_management  WHERE presence = 1 and  personalId = '$id' AND DATE = CURDATE() ";
        if(!$this->model->sql($sql)){
            $insert = array(
                "personalId" => $id,
                "date" => date("Y-m-d"),
                "shiftId" => "W",
                "inputDate" => date("Y-m-d H:i:s"),
            );
            $this->db->insert("time_management", $insert);
        }

        $data = array(
            "personal" =>$this->model->sql("SELECT p.id , p.name from personal p WHERE p.presence = 1 and p.id = '$id' ")[0],
            "item" => $this->model->sql($sql )[0],
            "timeManagementShift" =>  $this->model->sql("SELECT id, name,
                 DATE_FORMAT(`scheduleIn`, '%H:%i') AS `scheduleIn`,
                 DATE_FORMAT(`scheduleOut`, '%H:%i') AS `scheduleOut`
                 
            from time_management_shift "), 
            "offtime" =>  $this->model->sql("SELECT id, name FROM  offtime  where presence = 1  order by name asc "), 
       
            
        );
        echo json_encode($data);
    } 

    function insert()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $this->model->number('personal');
            $insert = array(
                "id" => $id,
                "name"          => $post['name'],
                "phone"          => $post['phone'],
                "email"          => $post['email'],
                "gender"          => $post['gender'],

                "birthDate" => $post['birthDate']['year'] . "-" . $post['birthDate']['month'] . "-" . $post['birthDate']['day'],
                "inputDate"     => date("Y-m-d H:i:s"),
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->insert('personal', $insert);

            $data = array(
                "id" => $id,
                "items" =>  $post,
            );
        }
        echo   json_encode($data);
    }

    function fnDelete()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $id = $post['id'];
            $update = array(
                "presence" => 0,  
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->update('time_management', $update, "id='$id'"); 
            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

    function fnUpdate()
    {
        $post =   json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $id = $post['id'];
            $update = array( 
                 "checkIn"  => $post['item']['checkIn'],
                 "checkOut" => $post['item']['checkOut'],
                 "overTime" => $post['item']['overTime'],
                 "offTimeId" => $post['item']['offTimeId'],
                "updateDate"    => date("Y-m-d H:i:s"),
            );
            $this->db->update('time_management', $update, "id='$id'"); 
            $data = array(
                "error" => false,
            );
        }
        echo   json_encode($data);
    }

 
}
