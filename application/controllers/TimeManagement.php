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
        if (!$this->model->header($this->db->openAPI)) {
            //  echo $this->model->error("Error auth");
            // exit;
        }
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
            "potongan_keterlambatan" => $this->model->sql("SELECT * from potongan_keterlambatan where presence = 1 order by pinaltyFee ASC"),
            "overtimeFee" => (int)$this->model->select('value','global_setting','id=300'),
            
        );
        echo json_encode($data);
    }


    function fnUpdateKeterlambatan()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $update = array(
                "value" =>  $post['overtimeFee'], 
            );
            $this->db->update('global_setting', $update, "id = 300 ");

            foreach ($post['item'] as $row) { 
                $update = array(
                    "note" =>  $row['note'],
                    "lateMinute" =>  $row['lateMinute'],
                    "pinaltyFee" => (int)$row['pinaltyFee'],
                );
                $this->db->update('potongan_keterlambatan', $update, "id = '" .  $row['id'] . "'");
            }
            $data = array(
                "error" => false, 
                "post" => $post,
            );
        }
        echo json_encode($data);
    }
    function today($id)
    {

        $sql = "SELECT * From time_management  WHERE presence = 1 and  personalId = '$id' AND DATE = CURDATE() ";
        if (!$this->model->sql($sql)) {
            $insert = array(
                "personalId" => $id,
                "date" => date("Y-m-d"),
                "shiftId" => $this->model->select("timeManagementShiftId", "employment", "personalId = '$id' "),
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
                 
            from time_management_shift where presence = 1 "),
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

    function fnDeleteKeterlambatan()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            $id = $post['id'];
            $update = array(
                "presence" => 0, 
            );
            $this->db->update('potongan_keterlambatan', $update, "id='$id'");
            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }
    function fnAddKeterlambatan()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true; 
            $insert = array( 
                "presence" => 1, 
            );
            $this->db->insert('potongan_keterlambatan', $insert);
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
                "shiftId" => $post['item']['shiftId'],
                "updateDate" => date("Y-m-d H:i:s"),
            );

            $jobPositionId = $this->model->select("jobPositionId","employment","personalId = '".$this->model->userId()."' ");
            if($this->model->select("_timeManagement","employment_jobposition","id= $jobPositionId ") == 1){
                $this->db->update('time_management', $update, "id='$id'");
                $error = false;
            } 
            $data = array(
                "error" => $error ,
                "userId" => $this->model->userId(),
            );
        }
        echo json_encode($data);
    }

    function attendanceInsert()
    {
        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {
            $this->db->query("SET GLOBAL local_infile=1;");
            global $file_attendance;
            $fileName = $post['item']['fileName'];
            $bulk = $this->db->query(" LOAD DATA LOCAL INFILE  
            '$file_attendance/$fileName'
            INTO TABLE attendance  
            FIELDS TERMINATED BY ';'  
            LINES TERMINATED BY '\r\n' 
            (`idx`,`code`,`dateIn`,`timeScan`,`checkIn`)");
            if ($bulk == 1) {
                $this->db->query("INSERT INTO time_management(personalId,DATE, checkIn,importData, inputDate)
                SELECT p.id AS 'personalId',
                    CONCAT(SUBSTRING(a.dateIn,7,4),'-',SUBSTRING(a.dateIn,4,2),'-',SUBSTRING(a.dateIn,1,2)) AS 'date',
                    a.timeScan, '1' AS 'importData',
                    CONCAT(CURDATE(),' ',CURTIME() ) as inputDate
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
                        tm.checkOut = a.timeScan,
                        tm.updateDate = CONCAT(CURDATE(),' ',CURTIME() )
                    WHERE tm.date = a.date AND tm.personalId = a.personalId
                ");

                $update = array(
                    "status" => 1,
                    "presence" => 1,
                    "note" => "Sync Success",
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update("attendance_log", $update, "id = " . $post['id']);

                $this->db->query("TRUNCATE TABLE attendance");

                $data = array(
                    "error" => false,
                    "status" => "done",
                );
            }
        }
    }

    function reports()
    {
        $beginMinusOneDay = $this->input->get('startDate');

        $endAddOneDay = date('Y-m-d H:i:s', strtotime($this->input->get('endDate') . ' +1 day'));


        $begin = new DateTime($beginMinusOneDay);
        $end = new DateTime($endAddOneDay);

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
            $where = "personalId = '" . $this->input->get('id') . "' AND   `date` = '" . $dt->format("Y-m-d") . "' ORDER BY id DESC limit 1";
            $shiftId = $this->model->select("shiftId", "time_management", $where);
            $scheduleIn = $this->model->select("scheduleIn", "time_management_shift", "id='$shiftId'");
            $scheduleOut = $this->model->select("scheduleOut", "time_management_shift", "id='$shiftId'");

            $checkIn = $this->model->select("checkIn", "time_management", $where);
            $checkOut = $this->model->select("checkOut", "time_management", $where);

            $workDay = $this->model->select($dt->format("D"), "time_management_shift", "id='$shiftId'");



            $temp = array(
                "day" => $dt->format("D"),
                "date" => $dt->format("Y-m-d"),
                "hour" => '',
                "job" => $workDay == 1 ? "Work" : ' - ',
                "checkIn" => '',
                "checkOut" => '',
                "late" => '',
                "lateInt" => '',
                "quickly" => '',
                "overtime" => '',
                "workingHour" => '',
                "minute" => array(
                    "late" => 0,
                    "quickly" => 0,
                    "overtime" => 0,
                ),
                "note" => "",
                "workDay" => $workDay,
                "shiftId" => $this->model->select("shiftId", "time_management", $where),
                "id" => $this->model->select("id", "time_management", $where),
            );
            if ($checkIn != "") {
                $time1 = new DateTime($scheduleIn);
                $time2 = new DateTime($checkIn);
                $intervalIn = $time1->diff($time2);

                $time11 = new DateTime($scheduleOut);
                $time22 = new DateTime($checkOut);
                $intervalOut = $time11->diff($time22);

                $quickly = (int) ($intervalOut->h . $intervalOut->i);

                $time81 = new DateTime($checkOut);
                $time82 = new DateTime($checkIn);
                $workingHours = $time81->diff($time82);
                $temp["workingHour"] = $workingHours->h . "h" . $workingHours->i . "m";
                $temp["job"] = $workDay == 1 ? $this->model->select("name", "time_management_shift", "id = '$shiftId' ") : 'Holiday';
                if ((int) ($workingHours->h . $workingHours->i) > 0) {

                    if ($workDay == 1) {

                        $isLate = strtotime($checkIn) > strtotime($scheduleIn) ? true : false;
                        $isQuickly = strtotime($checkOut) < strtotime($scheduleOut) ? true : false;
                        $isOvertime = strtotime($checkOut) > strtotime($scheduleOut) ? true : false;

                        $temp["hour"] = substr($scheduleIn, 0, -3) . "-" . substr($scheduleOut, 0, -3);

                        $temp["checkIn"] = substr($checkIn, 0, -3);
                        $temp["checkOut"] = substr($checkOut, 0, -3);

                        $temp["late"] = $isLate ? $intervalIn->h . "h" . $intervalIn->i . "m" : '';
                        $temp["quickly"] = $isQuickly ? $intervalOut->h . "h" . $intervalOut->i . "m" : '';
                        $temp["overtime"] = $isOvertime ? $intervalOut->h . "h" . $intervalOut->i . "m" : '';

                        $temp["workDay"] = $workDay;

                        if ($isLate == true) {
                            $summary['late']['minutes'] += $intervalIn->i;
                            $summary['late']['hours'] += $intervalIn->h;

                            $temp["minute"]['late'] = $intervalIn->h * 60 + $intervalIn->i;
                        }

                        if ($isQuickly == true) {
                            $summary['quickly']['minutes'] += $intervalOut->i;
                            $summary['quickly']['hours'] += $intervalOut->h;

                            $temp["minute"]['quickly'] = $intervalOut->h * 60 + $intervalOut->i;
                        }

                        if ($isOvertime == true) {
                            $summary['overtime']['minutes'] += $intervalOut->i;
                            $summary['overtime']['hours'] += $intervalOut->h;

                            $temp["minute"]['overtime'] = $intervalOut->h * 60 + $intervalOut->i;
                        }

                    }
                }

            }
            array_push($items, $temp);
        }



        $data = array(
            "summary" => array(
                //"late" => date('H:i', mktime($summary['late']['hours'], $summary['late']['minutes'])),
                "late" => ((int) ($summary['late']['hours'] + (int) date('H', mktime(0, $summary['late']['minutes'])))) . 'h' . date('i', mktime(0, $summary['late']['minutes'])) . 'm',

                //"quickly" => date('H:i', mktime($summary['quickly']['hours'], $summary['quickly']['minutes'])),
                "quickly" => ((int) ($summary['quickly']['hours'] + (int) date('H', mktime(0, $summary['quickly']['minutes'])))) . 'h' . date('i', mktime(0, $summary['quickly']['minutes'])) . 'm',

                //"overtime" => date('H:i', mktime($summary['overtime']['hours'], $summary['overtime']['minutes'])),
                "overtime" => ((int) ($summary['overtime']['hours'] + (int) date('H', mktime(0, $summary['overtime']['minutes'])))) . 'h' . date('i', mktime(0, $summary['overtime']['minutes'])) . 'm',

                "working" => ((int) ($summary['working']['hours'] + (int) date('H', mktime(0, $summary['working']['minutes'])))) . 'h' . date('i', mktime(0, $summary['working']['minutes'])) . 'm',
                //   "h" => (int) date('H', mktime(0,$summary['working']['minutes'])),
            ),

            "employee" => $employee,
            "items" => $items,

            "timeManagementShift" => $this->model->sql("SELECT id, name,
                 DATE_FORMAT(`scheduleIn`, '%H:%i') AS `scheduleIn`,
                 DATE_FORMAT(`scheduleOut`, '%H:%i') AS `scheduleOut`
                 
            from time_management_shift where presence = 1"),
            "offtime" => $this->model->sql("SELECT id, name FROM  offtime  where presence = 1  order by name asc "),
        );

        echo json_encode($data);


    }

    function logs()
    {
        $data = array(
            "items" => $this->model->sql("SELECT * from attendance_log where presence = 1 order by inputDate Desc limit 30"),
        );
        echo json_encode($data);
    }

    function location()
    {
        echo __FILE__;
    }
}