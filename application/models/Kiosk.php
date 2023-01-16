<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Kiosk extends CI_Model
{

    function __construct()
    {
        /* Call the Model constructor */
        $this->prefixDB = 'cso1_';
        parent::__construct();
    }

    

    function select($field, $table, $where = "")
    {
        $query = "SELECT " . $field . " FROM " . $table . " WHERE " . $where;
        $query = $this->db->query($query);
        if ($query->row()) {
            $row = $query->row();
            return  $row->$field;
        }
    }

    function outletId($getImei = "" ){
        $data = false;
        $imei = str_replace(["'", '"'], "", $getImei);
        $outletId = self::select("storeOutlesId","cso1_terminal","token = '$imei' and status = 1 and presence = 1");
        if( $imei != ""  && $outletId != "" ){ 
            $data =  $outletId;
        } 
        return  $data; 
    }

    function id($getImei = ""){
        $imei = str_replace(["'", '"'], "", $getImei);
        return self::select("id","cso1_terminal","token = '$imei' and status = 1 and presence = 1");
    }
}
