<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Pph21 extends CI_Controller
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

    function ptkp(){
        $data = array(
            "ptkp" => $this->model->sql("select * from pph21_ptkp where presence = 1  order by sorting ASC "),
            "tarif_pajak" => $this->model->sql("select * from pph21_tarif_pajak where presence = 1  order by taxPercent ASC "),
            
        );
        echo json_encode($data);
    }

    function fnSave(){
        $post = json_decode(file_get_contents('php://input'), true);
        $error = true;
        if ($post) {
            $error = true;
            foreach($post['ptkp'] as $row){
                $update = array(
                    "amount" => $row['amount'], 
                   
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('pph21_ptkp', $update, "id='".$row['id']."'");
            }
           
            foreach($post['tarif_pajak'] as $row){
                $update = array(
                    "note" => $row['note'], 
                    "minAmount" => $row['minAmount'], 
                    "maxAmount" => $row['maxAmount'],   
                    "TaxPercent" => $row['TaxPercent'],   
                    "updateDate" => date("Y-m-d H:i:s"),
                );
                $this->db->update('pph21_tarif_pajak', $update, "id='".$row['id']."'");
            }

            $data = array(
                "error" => false,
            );
        }
        echo json_encode($data);
    }

    function employee_thead()
    {
        $data = array(
            'companyBPSJ' => $this->model->select("company", "bpjs_setting", "id=200"),
            'companyJKK' => $this->model->select("company", "bpjs_setting", "id=110"),
            'companyJKM' => $this->model->select("company", "bpjs_setting", "id=111"),

            'employeeBPSJ' => $this->model->select("employee", "bpjs_setting", "id=200"),
            'employeeJHT' => $this->model->select("employee", "bpjs_setting", "id=100"),
            'employeeJP' => $this->model->select("employee", "bpjs_setting", "id=112"),
            
        );
        $data = array( 
            "data" => $data,
        );
        echo json_encode($data);
    }
    function employee(){
        $companyBPSJ = $this->model->select("company", "bpjs_setting", "id=200");
        $companyJKK = $this->model->select("company", "bpjs_setting", "id=110");
        $companyJKM = $this->model->select("company", "bpjs_setting", "id=111");
 
         
        $employeeBPSJ = $this->model->select("employee", "bpjs_setting", "id=200");
        $employeeJHT = $this->model->select("employee", "bpjs_setting", "id=100");
        $employeeJP = $this->model->select("employee", "bpjs_setting", "id=112");


        $sqlEmployee = "SELECT p.id, p.name, r.taxSalary,  r.tunjangan, r.taxPtkpStatus, 
        ((r.taxSalary+ r.tunjangan) * ($companyBPSJ/100))  AS 'bpjs',
        ((r.taxSalary+ r.tunjangan) * ($companyJKK/100))  AS 'jkk',
        ((r.taxSalary+ r.tunjangan) * ($companyJKM/100))  AS 'jkm',
        ((r.taxSalary+ r.tunjangan) + 
        ((r.taxSalary+ r.tunjangan) * ($employeeBPSJ/100)) +  
        ((r.taxSalary+ r.tunjangan) * ($companyJKK/100)) +  
        ((r.taxSalary+ r.tunjangan) * ($companyJKM/100)) )AS 'bruto'  
        FROM payroll AS r 
        JOIN personal AS p ON p.id = r.personalId
        WHERE r.presence = 1 order by p.name ASC;";
        $employee = $this->model->sql($sqlEmployee);

        $bpjsKes = 1;
        $data = [];
        $jabatanPercent = $this->model->select("value","global_setting","id=100");
        $jabatanAmount = $this->model->select("value","global_setting","id=101");
        foreach( $employee as $row){
            $temp = array(
                "byJabatan" => ($row['bruto'] *  $jabatanPercent) >  $jabatanAmount  ?  $jabatanAmount : ($row['bruto'] *  $jabatanPercent),
                "bpjsKes" => $row['bruto'] * ($bpjsKes/100), 
                "jht" => $row['bruto'] * ($employeeJHT/100), 
                "jp" => $row['bruto'] * ($employeeJP/100), 
                "netto" => 0,  
                "ptkpAmount" => (int)$this->model->select("amount","pph21_ptkp","id='".$row['taxPtkpStatus']."'"),
                "pkp" => 0,
                "pph21Year" => 0,
                "pph21Month" => 0,
                "taxPercent" => 0
            );

            $temp['netto'] = $row['bruto'] - ($temp['byJabatan'] + $temp['bpjsKes'] + $temp['jht'] + $temp['jp']);
            $temp['pkp'] = ($temp['netto'] * 12) + $row['taxSalary'] - $temp['ptkpAmount'];

            $temp['taxPercent'] =  (float)$this->model->select("taxPercent","pph21_tarif_pajak","maxAmount >= ".$temp['pkp']."
            ORDER BY taxPercent ASC LIMIT 1");

            $temp['pph21Year'] =  (int) ($temp['pkp']  *  ($temp['taxPercent'] / 100));
            $temp['pph21Month'] =  (int)($temp['pph21Year'] / 12);


            array_push($data, array_merge($row, $temp));
        }

        $thead = array(
            'companyBPSJ' => $this->model->select("company", "bpjs_setting", "id=200"),
            'companyJKK' => $this->model->select("company", "bpjs_setting", "id=110"),
            'companyJKM' => $this->model->select("company", "bpjs_setting", "id=111"),

            'employeeBPSJ' => $this->model->select("employee", "bpjs_setting", "id=200"),
            'employeeJHT' => $this->model->select("employee", "bpjs_setting", "id=100"),
            'employeeJP' => $this->model->select("employee", "bpjs_setting", "id=112"),
            
        );

        $data = array(
            "error" => false,
            "thead" => $thead,
            "data" => $data,
        );
        echo json_encode($data);
    }
}
