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

    function employee()
    {
        $data = array(
            "data" => $this->model->sql("SELECT e.personalId, p.name
            from employment AS e
            JOIN personal AS p ON p.id = e.personalId 
            WHERE e.presence = 1 
             "),
        );
        echo json_encode($data);
    }

    function today($id)
    {

        $sql = "SELECT * From time_management  WHERE presence = 1 and  personalId = '$id' AND DATE = CURDATE() ";
        if (!$this->model->sql($sql)) {
            $insert = array(
                "personalId" => $id,
                "date" => date("Y-m-d"),
                "shiftId" => "W",
                "inputDate" => date("Y-m-d H:i:s"),
            );
            $this->db->insert("time_management", $insert);
        }

        $data = array(
            "personal" => $this->model->sql("SELECT p.id , p.name from personal p WHERE p.presence = 1 and p.id = '$id' ")[0],
            "item" => $this->model->sql($sql)[0],
            "timeManagementShift" => $this->model->sql("SELECT id, name,
                 DATE_FORMAT(`scheduleIn`, '%H:%i') AS `scheduleIn`,
                 DATE_FORMAT(`scheduleOut`, '%H:%i') AS `scheduleOut`
                 
            from time_management_shift "),
            "offtime" => $this->model->sql("SELECT id, name FROM  offtime  where presence = 1  order by name asc "),


        );
        echo json_encode($data);
    }

    function insert()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $this->model->number('personal');
            $insert = array(
                "id" => $id,
                "name" => $post['name'],
                "phone" => $post['phone'],
                "email" => $post['email'],
                "gender" => $post['gender'],

                "birthDate" => $post['birthDate']['year'] . "-" . $post['birthDate']['month'] . "-" . $post['birthDate']['day'],
                "inputDate" => date("Y-m-d H:i:s"),
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->insert('personal', $insert);

            $data = array(
                "id" => $id,
                "items" => $post,
            );
        }
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
            $this->db->update('time_management', $update, "id='$id'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function fnUpdate()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $post['id'];
            $update = array(
                "checkIn" => $post['item']['checkIn'],
                "checkOut" => $post['item']['checkOut'],
                "overTime" => $post['item']['overTime'],
                "offTimeId" => $post['item']['offTimeId'],
                "updateDate" => date("Y-m-d H:i:s"),
            );
            $this->db->update('time_management', $update, "id='$id'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }


    function attendanceInsert()
    {
        global $file_attendance;
        $bulk = $this->db->query(" LOAD DATA LOCAL INFILE  
            '$file_attendance/Attendance3.txt'
            INTO TABLE attendance  
            FIELDS TERMINATED BY ';'  
            LINES TERMINATED BY '\r\n' 
            (`idx`,`code`,`dateIn`,`timeScan`,`checkIn`)");
        if ($bulk == 1) {
            $this->db->query("INSERT INTO time_management(personalId,DATE, checkIn,importData)
                SELECT p.id AS 'personalId',
                    CONCAT(SUBSTRING(a.dateIn,7,4),'-',SUBSTRING(a.dateIn,4,2),'-',SUBSTRING(a.dateIn,1,2)) AS 'date',
                    a.timeScan, '1' AS 'importData'
                    FROM attendance AS a
                    JOIN personal AS p ON a.idx = p.idx
                    WHERE a.checkIn = 'I' AND a.timeScan !=  ''
                    ORDER BY a.dateIn ASC 
           ");

            $this->db->query(" UPDATE time_management AS tm, (
                    SELECT p.id AS 'personalId',
                    a.idx,
                    CONCAT(SUBSTRING(a.dateIn,7,4),'-',SUBSTRING(a.dateIn,4,2),'-',SUBSTRING(a.dateIn,1,2))  AS 'date',
                    a.timeScan,
                    a.checkIn
                    FROM attendance AS a
                    JOIN personal AS p ON a.idx = p.idx
                    WHERE a.checkIn = 'o' AND a.timeScan != ''
                ) AS a
                SET 
                    tm.checkOut = a.timeScan
                WHERE tm.date = a.date AND tm.personalId = a.personalId
           ");
        }
        ;
    }

    function reports()
    {

        $begin = new DateTime($this->input->get('startDate'));
        $end = new DateTime($this->input->get('endDate'));

        $interval = DateInterval::createFromDateString('1 day');
        $period = new DatePeriod($begin, $interval, $end);
        $personalId = $this->input->get('id');
        $shiftId = $this->model->select("shiftId", "time_management", "personalId = '$personalId'");
        $items = [];

        $jobPosId = $this->model->select("jobPositionId", "employment", "personalId = '" . $this->input->get('id') . "'");
        $employee = array(
            "personalId" => $this->input->get('id'),
            "idx" => $this->model->select("idx", "personal", "id = '" . $this->input->get('id') . "'"),
            "name" => $this->model->select("name", "personal", "id = '" . $this->input->get('id') . "'"),
            "jobPositionId" => $this->model->select("name", "employment_jobposition", "id = '" . $jobPosId . "'"),
            "dateJoinStart" => $this->model->select("dateJoinStart", "employment", "personalId = '" . $this->input->get('id') . "'"),

        );

        $summary = array(
            'late' => array(
                "minutes" => 0,
                "hours" => 0,
            ),
            'quickly' => array(
                "minutes" => 0,
                "hours" => 0,
            ),
            'overtime' => array(
                "minutes" => 0,
                "hours" => 0,
            ), 
            'working' => array(
                "minutes" => 0,
                "hours" => 0,
            ), 
        );
        foreach ($period as $dt) {
            $isLate = false;
            $isQuickly = false;
            $isOvertime = false;
            $where = "personalId = '" . $this->input->get('id') . "' AND 
            `date` = '" . $dt->format("Y-m-d") . "' ORDER BY id DESC limit 1";

            $scheduleIn = $this->model->select("scheduleIn", "time_management_shift", "id='$shiftId'");
            $scheduleOut = $this->model->select("scheduleOut", "time_management_shift", "id='$shiftId'");

            $checkIn = $this->model->select("checkIn", "time_management", $where);
            $checkOut = $this->model->select("checkOut", "time_management", $where);

            $offDay = $this->model->select($dt->format("D"), "time_management_shift", "id='$shiftId'");


            $time1 = new DateTime($scheduleIn);
            $time2 = new DateTime($checkIn);
            $intervalIn = $time1->diff($time2);

            $time11 = new DateTime($scheduleOut);
            $time22 = new DateTime($checkOut);
            $intervalOut = $time11->diff($time22);

            $quickly = (int) ($intervalOut->h . $intervalOut->i);

            $temp = array(
                "day" => $dt->format("D"),
                "date" => $dt->format("Y-m-d"),
                "hour" => '',
                "job" =>  "Holiday" ,
                "checkIn" => '',
                "checkOut" => '',
                "late" => '',  
                "lateInt" => '', 
                "quickly" => '',
                "overtime" => '',
                "workingHour" => '',
                "note" => "",
                "off" => $offDay,
            );
            if ($offDay == 1) { 
                $isLate = strtotime($checkIn) > strtotime($scheduleIn) ? true : false;
                $isQuickly = strtotime($checkOut) < strtotime($scheduleOut) ? true : false;
                $isOvertime = strtotime($checkOut) > strtotime($scheduleOut) ? true : false;

                $temp["hour"] = substr($scheduleIn, 0, -3) . "-" . substr($scheduleOut, 0, -3);
                $temp["job"] = "Work";
                $temp["checkIn"] = substr($checkIn, 0, -3);
                $temp["checkOut"] = substr($checkOut, 0, -3);

                $temp["late"] = $isLate ? $intervalIn->h . "h" . $intervalIn->i . "m" : '';    
                $temp["quickly"] = $isQuickly ? $intervalOut->h . "h" . $intervalOut->i . "m" : '';  
                $temp["overtime"] = $isOvertime ? $intervalOut->h . "h" . $intervalOut->i . "m" : '';

                $time81 = new DateTime($checkOut);
                $time82 = new DateTime($checkIn);
                $workingHours = $time81->diff($time82);


                $temp["workingHour"] = $workingHours->h . "h" . $workingHours->i . "m" ;
                $temp["off"] = $offDay; 

                if($isLate == true){
                    $summary['late']['minutes'] += $intervalIn->i;
                    $summary['late']['hours'] += $intervalIn->h;
                }

                if($isQuickly == true){
                    $summary['quickly']['minutes'] += $intervalOut->i;
                    $summary['quickly']['hours'] += $intervalOut->h;
                }

                if($isOvertime == true){
                    $summary['overtime']['minutes'] += $intervalOut->i;
                    $summary['overtime']['hours'] += $intervalOut->h;
                }
              
                    $summary['working']['minutes'] += $workingHours->i;
                    $summary['working']['hours'] += $workingHours->h;
                 

            }  else{
                $temp['job'] = "Holiday";
            }

    

            array_push($items, $temp);

        }
      
 

        $data = array( 
            "summary" => array(
                "late" =>   date('H:i', mktime($summary['late']['hours'],$summary['late']['minutes'])),
                "quickly" =>   date('H:i', mktime($summary['quickly']['hours'],$summary['quickly']['minutes'])),
                "overtime" =>   date('H:i', mktime($summary['overtime']['hours'],$summary['overtime']['minutes'])),
               "working" =>   ((int)($summary['working']['hours']+ (int) date('H', mktime(0,$summary['working']['minutes']))) ).'h'. date('H', mktime(0,$summary['working']['minutes'])).'m',
            //   "h" => (int) date('H', mktime(0,$summary['working']['minutes'])),
            ),
            "employee" => $employee,
            "items" => $items,
           
        );

        echo json_encode($data);


    }

}