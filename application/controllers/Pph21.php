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
                    "TaxPercent" => $row['taxPercent'],   
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


        $sqlEmployeeDEL = "SELECT p.id, p.name, r.taxSalary,  r.tunjangan, r.taxPtkpStatus, r.bpsjTkNo, r.bpsjKesehatanNo,
        ((r.taxSalary) * ($employeeBPSJ/100))  AS 'bpjs_employeeBPSJ',
        ((r.taxSalary) * ($employeeJHT/100))  AS 'bpjs_employeeJHT',
        ((r.taxSalary) * ($employeeJP/100))  AS 'bpjs_employeeJP',

        ((r.taxSalary+ r.tunjangan) * ($companyBPSJ/100))  AS 'bpjs',
        ((r.taxSalary+ r.tunjangan) * ($companyJKK/100))  AS 'jkk',
        ((r.taxSalary+ r.tunjangan) * ($companyJKM/100))  AS 'jkm',

        ((r.taxSalary+ r.tunjangan) + 
        ((r.taxSalary+ r.tunjangan) * ($companyBPSJ/100)) +  
        ((r.taxSalary+ r.tunjangan) * ($companyJKK/100)) +  
        ((r.taxSalary+ r.tunjangan) * ($companyJKM/100)) )AS 'bruto'  
        FROM payroll AS r 
        JOIN personal AS p ON p.id = r.personalId
        WHERE r.presence = 1 order by p.name ASC;";

        $sqlEmployee = "SELECT p.id, p.name, r.taxSalary, r.tunjangan, r.taxPtkpStatus, r.bpsjTkNo, r.bpsjKesehatanNo, 
 
        IF(r.bpsjTkNo IS NULL or r.bpsjTkNo = '', 0, ((r.taxSalary) * ($employeeBPSJ/100)))  AS 'bpjs_employeeBPSJ', 
        IF(r.bpsjTkNo IS NULL or r.bpsjTkNo = '', 0, ((r.taxSalary) * ($employeeJHT/100)))  AS 'bpjs_employeeJHT', 
        IF(r.bpsjTkNo IS NULL or r.bpsjTkNo = '', 0, ((r.taxSalary) * ($employeeJP/100)))  AS 'bpjs_employeeJP', 
          
        IF(r.bpsjKesehatanNo IS NULL or r.bpsjKesehatanNo = '', 0, ((r.taxSalary+ r.tunjangan) * ($companyBPSJ/100)) )  AS 'bpjs', 
        IF(r.bpsjKesehatanNo IS NULL or r.bpsjKesehatanNo = '', 0, ((r.taxSalary+ r.tunjangan) * ($companyJKK/100)) )  AS 'jkk', 
        IF(r.bpsjKesehatanNo IS NULL or r.bpsjKesehatanNo = '', 0, ((r.taxSalary+ r.tunjangan) * ($companyJKM/100)) )  AS 'jkm', 
               
        
        ((r.taxSalary+ r.tunjangan) + 
        ((r.taxSalary+ r.tunjangan) * ($companyBPSJ/100))  + 
        ((r.taxSalary+ r.tunjangan) * ($companyJKK/100)) + 
        ((r.taxSalary+ r.tunjangan) * ($companyJKM/100)) )AS 'bruto' 
        FROM payroll AS r 
        JOIN personal AS p ON p.id = r.personalId 
        WHERE r.presence = 1 order by p.name ASC";
   
        $employee = $this->model->sql($sqlEmployee);

        $bpjsKes = 1;
        $data = [];
        $jabatanPercent = $this->model->select("value","global_setting","id=100");
        $jabatanAmount = $this->model->select("value","global_setting","id=101");
        foreach( $employee as $row){

           
            $temp = array(  
                "byJabatan" => ($row['bruto'] *  $jabatanPercent) >  $jabatanAmount  ?  $jabatanAmount : ($row['bruto'] *  $jabatanPercent),
                "bpjsKes" => $row['bpjs_employeeBPSJ'] , 
                "jht" => $row['bpjs_employeeJHT'],
                "jp" => $row['bpjs_employeeJP'],
                "netto" => 0,  
                "ptkpAmount" => (int)$this->model->select("amount","pph21_ptkp","id='".$row['taxPtkpStatus']."'"),
                "pkp" => 0,
                "pph21Year" => 0,
                "pph21YearObj" => [],
                "pph21Month" => 0,
                "taxPercent" => 0
            );

            $temp['netto'] = $row['bruto'] - ($temp['byJabatan'] + $temp['bpjsKes'] + $temp['jht'] + $temp['jp']);
            $temp['pkp'] = ($temp['netto'] * 12) - $temp['ptkpAmount'];

            $temp['taxPercent'] =  (float)$this->model->select("taxPercent","pph21_tarif_pajak","maxAmount >= ".$temp['pkp']."
            ORDER BY taxPercent ASC LIMIT 1");

            $temp['pph21YearObj'] =  $this->model->pkpObj($temp['pkp']);

            foreach($this->model->pkpObj($temp['pkp']) as $obj){
                $temp['pph21Year'] +=  $obj['taxAmount'];
            }

            $temp['pph21Month'] =  (int)($temp['pph21Year'] / 12);

            if( $temp['pkp'] < 0)  $temp['pkp'] = 0;
            if( $temp['pph21Year'] < 0)  $temp['pph21Year'] = 0;
            if( $temp['pph21Month'] < 0)  $temp['pph21Month'] = 0; 

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
            "q" =>  trim(preg_replace('/\s+/', ' ', $sqlEmployee)) ,
        );
        echo json_encode($data);
    }
}
