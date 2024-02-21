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

            "employmentStatus" => $this->model->sql("SELECT e.employmentStatusId , s.name, SUM(e.employmentStatusId)  AS 'qty'
            FROM employment AS e
            JOIN employment_status AS s ON s.id = e.employmentStatusId
            WHERE e.presence = 1
            GROUP BY e.employmentStatusId"),

            "employmentPosition" => $this->model->sql("SELECT e.jobPositionId, COUNT(e.jobPositionId)  AS 'qty', p.name
              FROM employment AS e 
              JOIN employment_jobposition AS p ON p.id = e.jobPositionId
              WHERE e.presence = 1
              GROUP BY e.jobPositionId"),

            "gender" => $this->model->sql("SELECT gender, COUNT(gender) AS 'qty' from personal
            GROUP BY gender"),

            "lenghtOfService" => array(
                    "note" => "< 1 yr",
                    "qty" => "",
            ),


        );

        echo json_encode($data, JSON_PRETTY_PRINT);
    }

}
