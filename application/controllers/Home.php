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

        $employmentStatus = $this->model->sql("SELECT e.employmentStatusId , s.name, SUM(e.employmentStatusId)  AS 'qty'
        FROM employment AS e
        JOIN employment_status AS s ON s.id = e.employmentStatusId
        WHERE e.presence = 1
        GROUP BY e.employmentStatusId");
        $total = 0;
        for ($i = 0; $i < count($employmentStatus); $i++) {
            $total += $employmentStatus[$i]['qty'];
        }
        for ($i = 0; $i < count($employmentStatus); $i++) {
            $percent = (float) ($employmentStatus[$i]['qty'] / $total * 100);
            $employmentStatus[$i]['percent'] = (float) number_format((float) $percent, 2, '.', '');
        }

        $employmentPosition = $this->model->sql("SELECT e.jobPositionId, COUNT(e.jobPositionId)  AS 'qty', p.name
        FROM employment AS e 
        JOIN employment_jobposition AS p ON p.id = e.jobPositionId
        WHERE e.presence = 1
        GROUP BY e.jobPositionId");
        $total = 0;
        for ($i = 0; $i < count($employmentPosition); $i++) {
            $total += $employmentPosition[$i]['qty'];
        }
        for ($i = 0; $i < count($employmentPosition); $i++) {
            $percent = (float) ($employmentPosition[$i]['qty'] / $total * 100);
            $employmentPosition[$i]['percent'] = (float) number_format((float) $percent, 2, '.', '');
        }



        $gender = $this->model->sql("SELECT gender, COUNT(gender) AS 'qty' from personal
        GROUP BY gender");
        $total = 0;
        $genderDataLabel = [];
        $genderDataDataset = [];
        for ($i = 0; $i < count($gender); $i++) {
            if ($gender[$i]['gender'] == 'F') {
                $gender[$i]['gender'] = "Female";
            } else if ($gender[$i]['gender'] == 'M') {
                $gender[$i]['gender'] = "Male";
            } else {
                $gender[$i]['gender'] = "Undefine";
            }

            $total += $gender[$i]['qty'];
            $genderDataLabel[] =  $gender[$i]['gender'];
        }
        for ($i = 0; $i < count($gender); $i++) {
            $percent = (float) ($gender[$i]['qty'] / $total * 100);
            $gender[$i]['percent'] = (float) number_format((float) $percent, 2, '.', '');
            $genderDataDataset[] = $gender[$i]['percent'];
        }


        $year0 = "SELECT SUM(qty) AS qty FROM ( 
        SELECT  YEAR(NOW()) - YEAR(dateJoinStart) AS totalYears, COUNT(YEAR(NOW()) - YEAR(dateJoinStart) ) AS 'qty'
        FROM employment
        WHERE  ( YEAR(NOW()) - YEAR(dateJoinStart)) < 100  AND presence = 1 AND STATUS = 1
        GROUP BY YEAR(NOW()) - YEAR(dateJoinStart)
        ) AS t
        WHERE  totalYears < 1";

        $year1to5 = "SELECT SUM(qty) AS qty FROM ( 
        SELECT  YEAR(NOW()) - YEAR(dateJoinStart) AS totalYears, COUNT(YEAR(NOW()) - YEAR(dateJoinStart) ) AS 'qty'
        FROM employment
        WHERE  ( YEAR(NOW()) - YEAR(dateJoinStart)) < 100  AND presence = 1 AND STATUS = 1
        GROUP BY YEAR(NOW()) - YEAR(dateJoinStart)
        ) AS t
        WHERE  totalYears >= 1 or  totalYears < 5";

        $year5to10 = "SELECT SUM(qty) AS qty FROM ( 
        SELECT  YEAR(NOW()) - YEAR(dateJoinStart) AS totalYears, COUNT(YEAR(NOW()) - YEAR(dateJoinStart) ) AS 'qty'
        FROM employment
        WHERE  ( YEAR(NOW()) - YEAR(dateJoinStart)) < 100  AND presence = 1 AND STATUS = 1
        GROUP BY YEAR(NOW()) - YEAR(dateJoinStart)
        ) AS t
        WHERE  totalYears >= 5 or  totalYears < 10";

        $year10 = "SELECT SUM(qty) AS qty FROM ( 
        SELECT  YEAR(NOW()) - YEAR(dateJoinStart) AS totalYears, COUNT(YEAR(NOW()) - YEAR(dateJoinStart) ) AS 'qty'
        FROM employment
        WHERE  ( YEAR(NOW()) - YEAR(dateJoinStart)) < 100  AND presence = 1 AND STATUS = 1
        GROUP BY YEAR(NOW()) - YEAR(dateJoinStart)
        ) AS t
        WHERE  totalYears >= 10  ";

        $lenghtOfServiceData = [
            (int) $this->model->sql($year0)[0]['qty'],
            (int) $this->model->sql($year1to5)[0]['qty'],
            (int) $this->model->sql($year5to10)[0]['qty'],
            (int) $this->model->sql($year10)[0]['qty'],
        ];


        $genderData = array(
            "label" =>  $genderDataLabel,
            "datasets" =>  $genderDataDataset,
        );
    
        $data = array(
            "error" => false,
            "colors" => ["#FF407D","#0B60B0","#2D9596","#7F27FF","#9B4444","#AC7D88","#37B5B6"],
            "ServerTime" => date("Y-m-d H:i:s"),
            "employmentStatus" => $employmentStatus,
            "employmentPosition" => $employmentPosition,
            "genderData" => $genderData,
            "gender" => $gender,

            "lenghtOfService" => array(
                    "labels" => [
                        "< 1yr",
                        "1-5yr",
                        "5-10yr",
                        "> 10yr"
                    ],
                    "datasets" => $lenghtOfServiceData,
                ),


        );

        echo json_encode($data, JSON_PRETTY_PRINT);
    }

}
