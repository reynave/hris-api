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
            echo $this->model->error("Error auth");
             exit;
        }
    }

    function ptkp(){
        $data = array(
            "ptkp" => $this->model->sql("select * from pph21_ptkp where presence = 1  order by jumlahAnak ASC "),
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
                    "jumlahAnak" => $row['jumlahAnak'], 
                    "PTKPTidakKawinLabel" => $row['PTKPTidakKawinLabel'], 
                    "PTKPTidakKawin" => $row['PTKPTidakKawin'],   
                    "PTKPKawinLabel" => $row['PTKPKawinLabel'],  
                    "PTKPKawin" => $row['PTKPKawin'],   
                    "PTKPGabunganSuamiIstriLabel" => $row['PTKPGabunganSuamiIstriLabel'],  
                    "PTKPGabunganSuamiIstri" => $row['PTKPGabunganSuamiIstri'],   
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
}
