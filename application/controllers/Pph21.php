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


    function employee(){
        $companyBPSJ = $this->model->select("company", "bpjs_setting", "id=200");
        $companyJKK = $this->model->select("company", "bpjs_setting", "id=110");
        $companyJKM = $this->model->select("company", "bpjs_setting", "id=111");
        $companyJHT = $this->model->select("company", "bpjs_setting", "id=100");
        $companyJP = $this->model->select("company", "bpjs_setting", "id=112");

        $employee = $this->model->sql("SELECT p.id, p.name, r.salary, r.tunjangan, r.taxPtkpStatus,
        ((r.salary+ r.tunjangan) * ($companyBPSJ/100))  AS 'bpjs',
        ((r.salary+ r.tunjangan) * ($companyJKK/100))  AS 'jkk',
        ((r.salary+ r.tunjangan) * ($companyJKM/100))  AS 'jkm',
        ((r.salary+ r.tunjangan) + 
        ((r.salary+ r.tunjangan) * ($companyBPSJ/100)) +  
        ((r.salary+ r.tunjangan) * ($companyJKK/100)) +  
        ((r.salary+ r.tunjangan) * ($companyJKM/100)) )AS 'bruto'  
        FROM payroll AS r 
        JOIN personal AS p ON p.id = r.personalId
        WHERE r.presence = 1");

        $bpjsKes = 1;
        $data = [];
        $jabatanPercent = 0.05;
        $jabatanAmount = 500000;
        foreach( $employee as $row){
            $temp = array(
                "byJabatan" => ($row['bruto'] *  $jabatanPercent) >  $jabatanAmount  ?  $jabatanAmount : ($row['bruto'] *  $jabatanPercent),
                "bpjsKes" => $row['bruto'] * ($bpjsKes/100), 
                "jht" => $row['bruto'] * ($companyJHT/100), 
                "jp" => $row['bruto'] * ($companyJP/100), 
                "netto" => 0,  
                "ptkpAmount" => (int)$this->model->select("amount","pph21_ptkp","id='".$row['taxPtkpStatus']."'"),
                "pkp" => 0,
                "pph21Year" => 0,
                "pph21Month" => 0,
                "taxPercent" => 0
            );

            $temp['netto'] = $row['bruto'] - ($temp['byJabatan'] + $temp['bpjsKes'] + $temp['jht'] + $temp['jp']);
            $temp['pkp'] = ($temp['netto'] * 12) + $row['salary'] - $temp['ptkpAmount'];

            $temp['taxPercent'] =  (float)$this->model->select("taxPercent","pph21_tarif_pajak","maxAmount >= ".$temp['pkp']."
            ORDER BY taxPercent ASC LIMIT 1");

            $temp['pph21Year'] =  (int) ($temp['pkp']  *  ($temp['taxPercent'] / 100));
            $temp['pph21Month'] =  (int)($temp['pph21Year'] / 12);


            array_push($data, array_merge($row, $temp));
        }

        $data = array(
            ///"error" => false,
            "data" => $data,
        );
        echo json_encode($data);
    }
}
