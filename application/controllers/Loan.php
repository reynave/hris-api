<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Loan extends CI_Controller
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
            "data" => $this->model->sql("SELECT l.*, CONCAT('Rp ', FORMAT(l.amount, 0)) AS 'amount',
            p.name AS 'personal'
            from loan AS l
            JOIN personal AS p ON p.id = l.personalId
            WHERE l.presence = 1 AND l.STATUS = 1"),

        );
        echo json_encode($data);
    }
    function select()
    {
        $data = array(
            "selectPersonal" => $this->model->sql("select id, name from personal where presence = 1 order by name ASC"),
        );
        echo json_encode($data);
    }

    function detail($id)
    {
        $data = array(
            "data" => $this->model->sql("SELECT * from loan_detail where presence = 1 and loanId =  '$id' "),

        );
        echo json_encode($data);
    }
    function insert()
    {

        $post = json_decode(file_get_contents('php://input'), true);
        $data = array(
            "error" => true,
        );
        if ($post) {

            $id = $this->model->number('loan');
            $error = true;
            $effectiveDate = $post['item']['effectiveDate']['year'] . "-" . $post['item']['effectiveDate']['month'] . "-" . $post['item']['effectiveDate']['day'];

            $insert = array(
                "id" => $id,
                "personalId" => $post['item']['personalId'],
                "amount" => $post['item']['amount'],
                "installment" => $post['item']['installment'],
                "description" => $post['item']['description'],
                "effectiveDate" => $effectiveDate,
                "inputDate" => date("Y-m-d H:i:s"),
            );
            $this->db->insert("loan", $insert);
            for ($i = 1; $i <= $post['item']['installment']; $i++) {

                $time = strtotime($effectiveDate);
 
                $final = date("Y-m-d", strtotime("+$i month", $time));
                $paymentAmount =  ceil($post['item']['amount'] / $post['item']['installment']);
                $insert2 = array(
                    "loanId" => $id,
                    "installment" => $i,
                    "paymentAmount" =>  $paymentAmount,
                    "paymentDate" => $final,
                    "balance" =>  $paymentAmount,
                    "paidAmount" => 0, 
                    "inputDate" => date("Y-m-d H:i:s"),
                );
                $this->db->insert("loan_detail", $insert2);
            }


            $data = array(
                "error" => false,
                "id" => $id,

            );
            echo json_encode($data);
        }

    }

}