<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Model extends CI_Model
{

    function __construct()
    {
        /* Call the Model constructor */
        $this->prefixDB = 'cso1_';
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
                if (self::select('id',  $this->prefixDB . 'userAuth', "status = 1 and token= '" .  $token . "'")) {
                    $userId = self::select('userId', $this->prefixDB . 'userAuth', "status = 1 and token= '" .  $token . "'");
                    if ($this->model->select("id", $this->prefixDB . "user", "id='$userId'")) {
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

            if ($this->model->select('id', $this->prefixDB . 'userAuth', "token= '$token'")) {
                return  $this->model->select('userId', $this->prefixDB . 'userAuth', "token= '$token'");
            } else {
                return false;
            }
        } else {
            return false;
        }
    }


    function idUser()
    {
        return $this->model->userId();
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
    function user_row($row, $level = 0)
    {
        $temp = array(
            "id" => $row->id,
            "level" => $level,
            "user_access" => array(
                "id" => $row->userId_access,
                "name" => $this->model->crm3('name', 'user_access', 'id=' . $row->userId_access),
            ),
            "user_group" =>  array(
                "id" => $row->userId_group,
                "name" => $this->model->crm3('name', 'user_group', 'id=' . $row->userId_group),
            ),
            "code" => $row->code,
            "max_discount" => $row->max_discount,
            "currency" => $this->model->currency('symbol'),

            "target_amount_year" => (int) $this->model->crm3('amount', 'user_target', ' userId = "' . $row->id . '" and  year=' . date('Y')),
            "name" => $row->first_name . ' ' . $row->last_name,
            "email" => $row->email,
            "input_date" => $row->input_date,
            "status" => (bool) $row->status,
            "child" => $this->model->crm3('count(id)', 'user', 'id_parent = ' . $row->id),
        );

        return $temp;
    }


    /** ACCESS RIGHT LITE */

    function _modify($module = "")
    {
        $userAccessId = self::select("userAccessId", "cso1_user", "id = '" . self::userId() . "' ");
        return (bool)self::select("_modify", "cso1_userAccessModule", "userAccessId=" . $userAccessId . " and module='" . $module . "' ");
    }

    /** end : ACCESS RIGHT */


    function isMyChild($id = 0)
    {
        // LEVEL 2
        if ($this->model->userId() === false) {
            return false;
        } else {
            if ($this->model->select('id_parent',  $this->prefixDB . 'user', 'id=' . $id) == $this->model->userId()) {
                return true;
            } else {
                // LEVEL 3
                $id_parent = $this->model->select('id_parent',  $this->prefixDB . 'user', 'id=' . $id) == $this->model->userId();
                if ($this->model->select('id_parent',  $this->prefixDB . 'user', 'id="' . $id_parent . '" ') == $this->model->userId()) {
                    return true;

                    // LEVEL 4
                    $id_parent = $this->model->select('id_parent',  $this->prefixDB . 'user', 'id=' . $id_parent) == $this->model->userId();
                    if ($this->model->select('id_parent',  $this->prefixDB . 'user', 'id="' . $id_parent . '" ') == $this->model->userId()) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }
    }






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

    function pages_recursive($id_parent = "", $level = 0, $json = "")
    {
        if (!$id_parent) $id_parent = 0;

        $json = array();

        $query = $this->db->query("SELECT * FROM " . $this->prefixDB . "user where id_parent = '" . $id_parent . "' order by name ASC");
        foreach ($query->result() as $row) {

            $sub = $this->model->select('count(id)',  $this->prefixDB . 'user', ' id_parent = "' . $row->id . '"  order by name ASC');
            // $agencyId = $this->model->select('agencyId', 'user', ' id = "' . $row->id . '"'); 
            //   $name = $this->model->select('name', 'agency', '  id = "' . $agencyId . '"');

            $level++;
            $data = array(
                "id" => $row->id,
                "name" => $row->name,
                "presence" => $row->presence,
                "treelevel" => $level,
                "children" => [],
            );
            if ($sub > 0) {
                $data['children'] = $this->model->pages_recursive($row->id, $level);
            }
            array_push($json, $data);
        }
        return $json;
    }

    function category($id_parent = "", $level = 0, $json = "")
    {
        if (!$id_parent) $id_parent = 0;

        $json = array();

        $query = $this->db->query("SELECT * FROM " . $this->prefixDB . "itemCategory where id_parent = '" . $id_parent . "' order by name ASC");
        foreach ($query->result() as $row) {

            $sub = (int) $this->model->sql("SELECT count(id) 'sub' FROM cso1_itemCategory WHERE  id_parent = " . $row->id)[0];
            $items = $this->model->sql("SELECT count(id) total FROM cso1_item WHERE  presence = 1 and itemCategoryId = " . $row->id)[0];
            $level++;
            $data = array(
                "id" => $row->id,
                "name" => $row->name,
                "items" =>  $items['total'],
                "presence" => $row->presence,
                "status" => $row->status,
                "treelevel" => $level,
                "children" => [],
            );
            if ($sub > 0) {
                $data['children'] = $this->model->category($row->id, $level);
            }
            array_push($json, $data);
        }
        return $json;
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


    // CUSTOM


    function promoId()
    {
        $time   = time();
        return  $this->model->select("id", "cso1_promotion", "startDate >= $time AND endDate <= $time AND presence =1 AND status = 1");
    }

    function priceLevel($kioskUuid)
    {
        $terminalId = self::select("terminalId", "cso1_kioskUuid", "kioskUuid='" . $kioskUuid . "' ");
        $storeOutlesId = self::select("storeOutlesId", "cso1_terminal", "id='" . $terminalId . "' ");

        $priceLevel = $this->model->select("priceLevel", "cso1_storeOutles", "id='$storeOutlesId'");

        return  $priceLevel;
    }

    function storeOutlesLimit($kioskUuid)
    {
        $terminalId = self::select("terminalId", "cso1_kioskUuid", "kioskUuid ='" . $kioskUuid . "' ");
        $storeOutlesId = self::select("storeOutlesId", "cso1_terminal", "id  ='" . $terminalId . "' ");

        $limit = $this->model->select("limit", "cso1_storeOutles", "id='$storeOutlesId'");
        return  $limit;
    }


    function priceLevelPromo($id)
    {
        $promotionId = $this->model->select("promotionId", "cso1_promotionItem", "id=" . $id);
        $storeOutlesId = $this->model->select("storeOutlesId", "cso1_promotion", "id='$promotionId'");

        $priceLevel = $this->model->select("priceLevel", "cso1_storeOutles", "id='$storeOutlesId'");
        return  $priceLevel;
    }


    function promotion($id, $kioskUuid = "")
    {
        $time   = time();
        $result  = [];
        $q = self::sql("SELECT * FROM cso1_promotion   WHERE startDate >= $time  AND endDate <= $time  AND presence =1 AND status = 1");
        foreach ($q as $r) {
            // $promoId = self::promoId();
            $promoId = $r['id'];
            $discAmount = 0;

            // PRICE LEVEL
            $terminalId = self::select("terminalId", "cso1_kioskUuid", "status =1 and presence = 1 and kioskUuid = '$kioskUuid'");
            $storeOutlesId = self::select("storeOutlesId", "cso1_terminal", "status =1 and presence = 1 and token = '$terminalId'");
            $priceLevel = self::select("priceLevel", "cso1_storeOutles", "status =1 and presence = 1 and id = '$storeOutlesId'");


            //echo  ' terminalId : '.$terminalId.' | storeOutlesId:  '.$storeOutlesId.' | priceLevel: '.$priceLevel ;
            if ($r['typeOfPromotion'] == 1) {

                $cso1_kioskCart = self::sql("SELECT * FROM cso1_kioskCart   WHERE  kioskUuid = '$kioskUuid' and  presence =1 ");

                foreach ($cso1_kioskCart  as $row) {

                    $promotionItemId = self::select("id", "cso1_promotionItem", " presence = 1  AND promotionId = '$promoId' and itemId = '" . $row['itemId'] . "' ");
                    $discountFinal = 0;
                    $qtyFrom  =  0;
                    $qtyTo = 0;
                    if ($promotionItemId) {
                        $specialPrice = self::select("specialPrice", "cso1_promotionItem", " id = $promotionItemId ");
                        $discountPrice  = self::select("discountPrice", "cso1_promotionItem", " id = $promotionItemId ");
                        $qtyFrom  = self::select("qtyFrom", "cso1_promotionItem", " id = $promotionItemId ");
                        $qtyTo  = self::select("qtyTo", "cso1_promotionItem", " id = $promotionItemId ");

                        $originPrice  = self::select("originPrice", "cso1_kioskCart", " itemId = '" . $row['itemId'] . "'  and kioskUuid = '$kioskUuid'");

                        $qty  = self::sql(" SELECT count(id) as qty FROM cso1_kioskCart 
                        WHERE presence = 1 and void = 0 and  itemId = '" . $row['itemId'] . "'  and kioskUuid = '$kioskUuid'")[0]['qty'];

                        $disc1  = self::select("disc1", "cso1_promotionItem", " id = $promotionItemId ") / 100;
                        $disc2  = self::select("disc2", "cso1_promotionItem", " id = $promotionItemId ") / 100;
                        $disc3  = self::select("disc3", "cso1_promotionItem", " id = $promotionItemId ") / 100;

                        $discLevel1 = $specialPrice * $disc1;

                        $discLevel2 =  ($specialPrice - $discLevel1) * $disc2;
                        $discLevel3 =  ($specialPrice - $discLevel1 - $discLevel2) * $disc3;

                        $discLevel = $discLevel1 + $discLevel2 + $discLevel3;


                        $discount = 0;
                        if (($qty >= $qtyFrom) && ($qty <= $qtyTo)) {
                            $update = array(
                                "price"         => $specialPrice > 0 ? $specialPrice : $originPrice,
                                "price"         => $specialPrice,
                                "discount"      => $discountPrice > 0 ? $discountPrice : $discLevel,
                                "updateDate"    => time(),
                            );
                            $this->db->update("cso1_kioskCart", $update, " id = $id ");
                        }
                    }
                }
            }

            if ($r['typeOfPromotion'] == 2) {
                $a = $this->model->sql("select count(id) as qty, itemId,   sum(price) as price
                from cso1_kioskCart 
                where kioskUuid = '$kioskUuid' and itemId = '" . $row['itemId'] . "' and presence = 1
                group by itemId")[0];
                $promotionFreeId = self::select("id", "cso1_promotionFree", " presence = 1  AND promotionId = '$promoId' and itemId = '" . $row['itemId'] . "' ");
                $qtyPromo = (int)self::select("qty", "cso1_promotionFree", " id =  '$promotionFreeId' ");
                $qtyFree = (int)self::select("freeQty", "cso1_promotionFree", " id =  '$promotionFreeId' ");
                $freeItemId = self::select("freeItemId", "cso1_promotionFree", " id =  '$promotionFreeId' ");
                $applyMultiply = (int)self::select("applyMultiply", "cso1_promotionFree", " id =  '$promotionFreeId' ");
                $qtyFreeTemp = (int)self::sql("SELECT count(id) as 'qtyFreeTemp' From  cso1_kioskCartFreeItem 
                WHERE presence = 1 AND status = 0 AND kioskUuid = '$kioskUuid' AND promotionFreeId =  '$promotionFreeId' AND itemId = '" . $freeItemId . "' ")[0]['qtyFreeTemp'];

                $totalCart = self::sql("SELECT count(id) as 'totalCart' From  cso1_kioskCart 
                WHERE presence = 1  AND kioskUuid = '$kioskUuid'   AND itemId = " . $row['itemId'])[0]['totalCart'];
                $addFreeItem = false;


                if ($applyMultiply == 1) {
                    $addFreeItem = true;
                } else if ($applyMultiply == 0 && $qtyFreeTemp == 0) {
                    $addFreeItem = true;
                }
                array_push($result, array(
                    'promotionFreeId'   => $promotionFreeId,
                    'totalCart'         => $totalCart,
                    'qtyPromo'               => $qtyPromo,
                    'qtyFree'           => $qtyFree,
                    'freeItemId'        => $freeItemId,
                    "qtyFreeTemp"       => $qtyFreeTemp,
                    "modulus" => $qtyPromo > 0 ? ($totalCart % $qtyPromo) : 0,
                    "applyMultiply" => (bool)$applyMultiply,
                    "addFreeItem" => $addFreeItem,
                ));
                if ($qtyPromo > 0) {

                    if (($totalCart >= $qtyPromo) &&  (($totalCart % $qtyPromo) == 0) &&  $addFreeItem == true) {
                        // INSERT TABLE FREE 
                        for ($i = 0; $i < $qtyFree; $i++) {
                            $insert = array(
                                "kioskCartId" => $id,
                                "useBykioskUuidId" => 0,
                                "promotionFreeId" => $promotionFreeId,
                                "kioskUuid" => $kioskUuid,
                                "itemId" => $freeItemId,
                                "presence" => 1,
                                "status" => 0,
                                "inputDate" => time(),
                                "updateDate" => time(),
                            );
                            $this->db->insert("cso1_kioskCartFreeItem", $insert);
                        }
                    }
                }
            }
        }
        return $result;
    }

    function summary($uuid = "")
    {
        $memberId =  $this->model->select("memberId", "cso1_kioskUuid", "presence = 1 AND status = 1  AND kioskUuid = '" . $uuid . "'");

        $discountMember = 0;
        if ((int)$memberId > 0) {
            $discountMember = (int)$this->model->sql("SELECT sum(discountAmount) as 'discountAmount', 
        sum(discountPercent) as 'discountPercent'
        from cso1_promotion where presence =1 and status =  1 and startDate >= " . time() . "  and endDate <= " . time())[0]['discountAmount'];
        }
        $bkp  = (int)$this->model->sql("  SELECT  sum(c.price) as 'total'
                from cso1_kioskCart as c
                join cso1_item as i on i.id = c.itemId
                join cso1_taxCode as x on x.id = i.itemTaxId
                where c.presence = 1 and  kioskUuid = '$uuid' and x.percentage > 0 and x.taxType = 1
            ")[0]['total'] + (int)$this->model->sql("  SELECT  sum (c.price*(x.percentage /100) + c.price ) as 'total'
                from cso1_kioskCart as c
                join cso1_item as i on i.id = c.itemId
                join cso1_taxCode as x on x.id = i.itemTaxId
                where c.presence = 1 and  kioskUuid = '$uuid' and x.percentage > 0 and x.taxType = 0
            ")[0]['total'];
        $nonBkp = (int)$this->model->sql("  SELECT   sum(c.price) as 'total'
            from cso1_kioskCart as c
            join cso1_item as i on i.id = c.itemId
            join cso1_taxCode as x on x.id = i.itemTaxId
            where c.presence = 1 and  kioskUuid = '$uuid' and x.percentage = 0")[0]['total'];

            
        $ppnExc = (int)$this->model->sql("SELECT sum(((c.price - c.discount) * (t.percentage/100)) ) as 'tax' 
            from cso1_kioskCart as c
            join cso1_item as i on c.itemId = i.id
            left join cso1_taxCode as t on t.id = i.itemTaxId
            where c.presence = 1 and c.isFreeItem = 0 and c.kioskUuid = '$uuid' and t.taxType = 0 ")[0]['tax'];
            
        $ppnInc = (int)$this->model->sql("SELECT sum(c.price - ((c.price - c.discount) / (t.percentage/100 + 1))) as    'ppnInc' 
            from cso1_kioskCart as c
            join cso1_item as i on c.itemId = i.id
            left join cso1_taxCode as t on t.id = i.itemTaxId
            where c.presence = 1 and c.isFreeItem = 0 and c.kioskUuid = '$uuid' and t.taxType = 1 ")[0]['ppnInc'];
      
        $summary = array(
            "total" => $this->model->sql("SELECT sum(k.price) as 'subTotal'
                    FROM cso1_kioskCart as k
                    where k.presence = 1 and k.kioskUuid = '$uuid' ")[0]['subTotal'],
            "discount" => $this->model->sql("SELECT sum(k.discount) as 'discount'
                    FROM cso1_kioskCart as k
                    where k.presence = 1 and k.kioskUuid = '$uuid' ")[0]['discount'],
            "memberDiscount" =>   $discountMember, 
            "voucer" => 0,

            // Barang Kena Pajak 
            "bkp" => $bkp - ($ppnExc + $ppnInc),
            "dpp" => $bkp+$nonBkp, 

            //harga sebelum ppn + (harga sebelum ppn x 0.11) = 100.000
            "ppn" => $ppnInc+ $ppnExc,

            "nonBkp" => $nonBkp,
            "final" => 0,

        );

        $summary['final'] = $summary['total']  - $summary['discount'] -  $summary['memberDiscount'] ;
        return $summary;
    }


    function minmax($val, $max, $min)
    {
        if ($val < 0) $val = 0;
        if ($val > $max) {
            $val = $max;
        }
        if ($val < $min) {
            $val = $min;
        }

        return $val;
    }
     /***
     * BARCODE CUSTOM
     */

     function barcode($code){
        $barcode = str_split($code);
       if(count( $barcode ) >= 13){

     
        $digitPrefixPosition = (int)$this->model->select("value","cso1_account","id=51");
        $digitItem = (int)$this->model->select("value","cso1_account","id=52");
        $digitWeight = (int)$this->model->select("value","cso1_account","id=53");
        $digitFloat = (int)$this->model->select("value","cso1_account","id=54");

        $item  = "";
        
        $prefix = $barcode[$digitPrefixPosition-1];
        for($i = 1; $i<= $digitItem; $i++){
            $item .=  $barcode[$i];
        }
        $weight = "";
        for($i = $digitItem+1; $i<= $digitItem+$digitWeight; $i++){
            $weight .=  $barcode[$i];
        }
        $pow = 10;
        for($i = 1; $i<+ $digitFloat ; $i++){
            $pow = 10*$pow;
        } 
        $weight =  (float)$weight/$pow ;

        $checkDigit = !isset($barcode[$digitPrefixPosition+$digitItem+$digitWeight]) ? 0:$barcode[$digitPrefixPosition+$digitItem+$digitWeight];

      
        $array = array(
            "barcode" => $code,
          // "raw" =>    $barcode,
            "config" => array(
                "digitPrefixPosition"   => $digitPrefixPosition,
                "digitItem"             => $digitItem,
                "digitWeight"           => $digitWeight, 
                "digitFloat"            => $digitFloat,
            ),
            "prefix" => $prefix,
            "itemId" => $prefix == 2 ? $item  : $code,
            "weight" => $weight,
            "checkDigit" => $checkDigit, 
        );
            return $array;
        }else{
            return $code;
        }
       
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
