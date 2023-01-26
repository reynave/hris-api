<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Model extends CI_Model
{

    function __construct()
    {
        /* Call the Model constructor */
        $this->prefixDB = '';
        parent::__construct();
    }

    function https()
    {
        if ($this->db->https == TRUE) {
            if (!isset($_SERVER['HTTPS']) || $_SERVER['HTTPS'] != "on") {
                $url = "https://" . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
                redirect($url);
                exit;
            }
        }
    }
    function selected($value1 = "", $value2 = "")
    {
        if ($value1 == $value2) {
            return 'selected="selected"';
        }
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



    function base64Decode($description = "")
    {
        $description  = str_replace(' ', '+', $description);
        $description  = base64_decode($description);
        return $description;
    }

    function token($token = "")
    {
        if ($this->model->select('id',  $this->prefixDB . 'user', 'token= "' . $token . '"  and presence = 1')) {
            return $this->model->select('id',  $this->prefixDB . 'user', 'token= "' . $token . '"  and presence = 1');
        } else {
            return false;
        }
    }
    function checkDeviceObj(){
        $headers = apache_request_headers();
        if($this->model->select("id","cso1_terminal"," presence = 1 and token = '".$headers['Token']."'") ){
            $data = true; 
        }else{
            $data = false; 
        }

        return  $data;
    }
    function getDeviceObj(){
        $headers = apache_request_headers();
        if($this->model->select("id","cso1_terminal"," presence = 1 and token = '".$headers['Token']."'") ){
          
            $this->terminalId = $this->model->select("id","cso1_terminal"," presence = 1 and token = '".$headers['Token']."'");
            $this->storeOutlesId = $this->model->select("storeOutlesId","cso1_terminal","  presence = 1 and token = '".$headers['Token']."'"); 
            $data = array(
                "error" => false,
                "headers" => $headers['Token'], 
                "note" => "",
                "terminalId" =>  $this->terminalId,
                "storeOutlesId" =>  $this->storeOutlesId, 
            );
        }else{
            $data = array(
                "error" => true,
                "header" => false,
                "note" => "Token not register",
                "terminalId" =>  false,
                "storeOutlesId" => false, 
            ); 
        }

        return  $data;
    }

    function error($note = "")
    {
        $json = array(
            "error" => 400,
            "note" => $note,
        );

        return json_encode($json);
    }

    function key()
    {
        $headers = apache_request_headers();

        if (isset($headers['Key'])) {
            if ($headers['Key'] == $this->db->key) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    function header($openAPI = false)
    {
        $headers = apache_request_headers();

        if (apache_request_headers() === null) {
            return false;
        } else {


            if (isset($headers['Token'])) {
                $token =  $headers['Token'];
            } else {
                $token =  isset($headers['token']) ? $headers['token'] : false;
            }

            if ($openAPI == true) {
                return  true;
            } else if ($token) {
                if (self::select('id',  $this->prefixDB . 'personal_access', "status = 1 and token= '" .  $token . "'")) {
                    $userId = self::select('personalId', $this->prefixDB . 'personal_access', "status = 1 and token= '" .  $token . "'");
                    if ($this->model->select("id", $this->prefixDB . "personal", "id='$userId'")) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }

    function generateRandomString($length = 25)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    function checkKey()
    {
        $headers = apache_request_headers();
        if (isset($headers['Key'])) {
            if (($headers['Key'] == $this->db->key)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }


    function userId()
    {
        $headers = apache_request_headers();
        if (isset($headers['token']) || isset($headers['Token'])) {
            $token = isset($headers['token']) ? $headers['token'] : $headers['Token'];

            if ($this->model->select('id', $this->prefixDB . 'personal_access', "token= '$token'")) {
                return  $this->model->select('personalId', $this->prefixDB . 'personal_access', "token= '$token'");
            } else {
                return false;
            }
        } else {
            return false;
        }
    }


    function idUser()
    {
        return $this->model->personalId();
    }

    function number($name = "")
    {
        if ($name) {
            $number = $this->model->select('runningNumber', 'auto_number', "name = '" . $name . "'") + 1;
            $prefix = $this->model->select('prefix', 'auto_number', "name = '" . $name . "'");
            if ($prefix == '$year') {
                $prefix = date("Y");
            }
            $update = array(
                "runningNumber"     => $number,
                "updateDate"        =>  time(),
            );
            $this->db->update("auto_number", $update, "name = '" . $name . "'");

            $new_number = str_pad($number, $this->model->select('digit', 'auto_number', "name = '" . $name . "'"), "0", STR_PAD_LEFT);

            return $prefix . $new_number;
        }
    }

    function folder($upload_path)
    {
        if (is_dir($upload_path) === false) {
            mkdir($upload_path);
        }
        return true;
    }




    function user($id = 0)
    {
        if ($id == 0) {
            return false;
        } else {
            return $this->model->select('concat(first_name," ",last_name)',  $this->prefixDB . 'user', 'id="' . $id . '"');
        }
    }

    function id_currency()
    {
        return  $this->model->select('value', 'global', 'id=10');
    }

    function currency($colomn = "symbol")
    {
        return $this->model->select($colomn, 'currency', 'isDefault = 1');
    }
    /** End : master data */


    /**
     * USER
     */ 

   
    function sendMail($subject = [])
    {
        $this->load->helper('email');

        $config = array();
        $config['protocol'] = 'smtp';
        $config['wordwrap'] = TRUE;
        $config['charset'] = 'iso-8859-1';
        $config['mailtype'] = 'html';

        $config['smtp_host'] = $this->model->select("value", "global_setting", "id=700");
        $config['smtp_user'] = $this->model->select("value", "global_setting", "id=701");
        $config['smtp_pass'] = $this->model->select("value", "global_setting", "id=702");
        $config['smtp_port'] = $this->model->select("value", "global_setting", "id=703");


        $to       = $subject['to'];

        $this->email->initialize($config);
        $this->email->set_newline("\r\n");

        $this->email->from($config['smtp_user']);
        $this->email->to($to);
        $this->email->subject($subject['subject']);
        $this->email->message($subject['message']);
        $this->email->send(FALSE);
        return  $this->email->print_debugger();
    }

    function sql($q)
    {
        $query = $this->db->query($q);
        return $query->result_array();
    }

  
    function clean($string)
    {
        $string = str_replace([' ', "'", '"'], '-', $string); // Replaces all spaces with hyphens.

        return    $string; // Removes special chars.
    }

    function array_flatten($array)
    {
        if (!is_array($array)) {
            return FALSE;
        }
        $result = array();
        foreach ($array as $key => $value) {
            if (is_array($value)) {
                $result = array_merge($result, $this->model->array_flatten($value));
            } else {
                $result[$key] = $value;
            }
        }
        return $result;
    }

 

    /***
     * BASE 64 images
     */


    function base64_to_jpeg($data, $output_file, $filename = "")
    {
        list($type, $data) = explode(';', $data);
        list(, $data)      = explode(',', $data);
        $data = base64_decode($data);
        $signname = strtolower($filename);
        $signname = str_replace(" ", "-", $signname);

        file_put_contents($output_file . $signname . '.png', $data);

        return $output_file . $signname . '.png';
    }


    function cam_to_img($data, $output_file, $filename = "")
    {
        $data =  str_replace("data:image/png;base64,","",$data);

        $data = base64_decode($data);
        $signname = strtolower($filename);
        $signname = str_replace(" ", "-", $signname);

        file_put_contents($output_file . $signname . '.png', $data);

        return $output_file . $signname . '.png';
    }
}
