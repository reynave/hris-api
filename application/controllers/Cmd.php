<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Cmd extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->item = "item.txt";
        $this->barcode = "barcode.txt";

        $this->promo_header = "promo_header.txt";
        $this->promo_detail = "promo_detail.txt";
        $this->promo_free = "promo_free.txt";
        date_default_timezone_set('Asia/Jakarta');
        error_reporting(E_ERROR | E_PARSE);
        $this->time = array(
            "promo" => "04:00:10",
            "item" => "05:00:10",
            "transaction" => "01:00:10",
        );
    }
    // CALL cmd : php index.php Cmd
    function index()
    {
        echo "\n" . "Server Run ver 1.0.3" . "\n \n";
        $i = 0;
        do {
            $i++;
            echo  $i . ' ' . date("D Y-m-d H:i:s") . "  | Next Schadule " . " \n";
            print_r($this->time);
            echo "\n\n";


            if ($this->time['promo'] == date("H:i:s")) {
                echo $this->time['promo'];
                self::promoHeader();
                self::promoDetail();
                self::promoFree();
            }

            if ($this->time['item'] == date("H:i:s")) {
                echo $this->time['item'];
                self::masterItem();
                self::masterItemBarcode();
            }

            if ($this->time['transaction'] == date("H:i:s")) {
                echo $this->time['transaction'];
                self::transaction();
            }



            sleep(1);
        } while (true);
    }
    //php index.php Cmd item
    function item()
    {
        self::masterItem();
        self::masterItemBarcode();
    }


    function fixBarcode()
    {
        echo "FIX BARCODE ITEM";
        $sql = "SELECT * from cso1_transactionDetail";

        foreach ($this->model->sql($sql) as $row) {
            print_r($row);
            $update = array(
                "barcode" => $this->model->select("barcode", "cso1_itemBarcode", "id=" . $row['itemId'] . " order by barcode DESC")
            );
            $this->db->update("cso1_transactionDetail", $update, "id=" . $row['id']);
            // $this->db->update("cso1_transactionDetail",$update,"(barcode is null  or barcode = ''  ) and id=".$row['id']);
        }
    }


    function promo()
    {
        self::promoHeader();
        self::promoDetail();
        self::promoFree();
    }

    function transaction()
    {
        $this->load->model('transaction');
        echo $this->transaction->sync(date("Y-m-d"));
    }

    function total()
    {
        $fileName =   $this->promo_detail;
        $file = new SplFileObject("../sync/$fileName", 'r');
        $file->seek(PHP_INT_MAX);
        echo $file->key();;
    }

    function bulfInsert(){
        /**
         * HOW TO CALL :
         * php index.php Cmd masterItem
         */
        $this->db->query("EXEC TableSP2"); 
        echo $this->db->last_query();
    }

    function masterItem()
    {
        /**
         * HOW TO CALL :
         * php index.php Cmd masterItem
         */
        $i = 0;

        // $this->db->trans_start();
        $fileName =   $this->item;

        $file = new SplFileObject("../sync/$fileName", 'r');
        $file->seek(PHP_INT_MAX);
        $file->key();

        if ($file->key() > 0) {

            $handle = fopen("../sync/$fileName", "r");
            if ($handle) {
                while (($line = fgets($handle)) !== false) {
                    $ar =  explode("|", $line);
                    $this->db->delete("cso1_item", "id='$ar[0]'");
                    $i++;
                    $insert = array(
                        "id" => $ar[0],
                        "description" => $ar[1],
                        "shortDesc" =>  $ar[2],
                        "price1" =>  (int)$ar[3],
                        "price2" =>  (int)$ar[4],
                        "price3" =>  (int)$ar[5],
                        "price4" =>  (int)$ar[6],
                        "price5" =>  (int)$ar[7],
                        "price6" =>  (int)$ar[8],
                        "price7" =>  (int)$ar[9],
                        "price8" =>  (int)$ar[10],
                        "price9" =>  (int)$ar[11],
                        "price10" => (int)$ar[12],

                        "itemUomId"         =>   $ar[13],
                        "itemCategoryId"    =>   $ar[14],
                        "itemTaxId"         =>   $ar[15],
                        "images"            =>   $ar[16],

                        "status" => 1,
                        "presence" => 1,
                        "inputDate" => time(),
                        "updateDate" => time(),
                    );
                    $this->db->insert("cso1_item", $insert);
                    echo "masterItem INSERT " . $ar[0] . "\n";
                }
                $insert = array(
                    "fileName" => $fileName,
                    "totalInsert" => $i,
                    "lastSycn" => date("Y-m-d H:i:s"),
                    "inputDate" => time(),
                );
                $this->db->insert("cso1_sync", $insert);
                print_r($insert);
                fclose($handle);
            }
        } else {
            echo "\n $fileName NO DATA";
        }
    }

    function masterItemBarcode()
    {

        $fileName =   $this->barcode;
        $file = new SplFileObject("../sync/$fileName", 'r');
        $file->seek(PHP_INT_MAX);
        $file->key();

        if ($file->key() > 0) {
            $this->db->query("Truncate table cso1_itemBarcode");
            echo $this->db->last_query() . "\n\m";
            $handle = fopen("../sync/$fileName", "r");
            $i = 0;
            if ($handle) {
                while (($line = fgets($handle)) !== false) {
                    $i++;
                    $ar =  explode("|", $line);
                    $id = $this->model->select("id", "cso1_itemBarcode", "itemId='$ar[0]' and barcode = '$ar[1]' ");
                    if (!$id) {
                        $insert = array(
                            "itemId" => $ar[0],
                            "barcode" =>  trim(preg_replace('/\s\s+/', ' ', $ar[1])),
                            "status" => 1,
                            "presence" => 1,
                            "inputDate" => time(),
                            "updateDate" => time(),
                        );
                        $this->db->insert("cso1_itemBarcode", $insert);
                        echo $i . " barcode INSERT " . $ar[0] . '|' . $ar[1]  . "\n";
                    } else {
                        echo $i . " barcode SKIP " . $ar[0] . '|' . $ar[1] . "\n";
                    }
                }
                $insert = array(
                    "fileName" => $fileName,
                    "totalInsert" => $i,
                    "lastSycn" => date("Y-m-d H:i:s"),
                    "inputDate" => time(),
                );
                $this->db->insert("cso1_sync", $insert);
                fclose($handle);
            }
        } else {
            echo "\n $fileName NO DATA";
        }
    }

    function promoHeader()
    {
        $i = 0;
        $fileName = $this->promo_header;
        $handle = fopen("../sync/$fileName", "r");
        if ($handle) {
            while (($line = fgets($handle)) !== false) {
                $i++;
                $ar =  explode("|", $line);
                $this->db->delete("cso1_promotion", "id='$ar[0]'");
                $insert = array(
                    "id"                => $ar[0],
                    "typeOfPromotion"   => (int)$ar[1],
                    "storeOutlesId"     => $ar[2],
                    "code"              => $ar[3],
                    "description"       => $ar[4],
                    "startDate"         => (int)$ar[5],
                    "endDate"           => (int)$ar[6],
                    "discountPercent"   => (float)$ar[7],
                    "discountAmount"    => (float)$ar[8],
                    "status"            => (int)$ar[9],

                    "Mon"          => (int)$ar[10],
                    "Tue"          => (int)$ar[11],
                    "Wed"          => (int)$ar[12],
                    "Thur"         => (int)$ar[13],
                    "Fri"          => (int)$ar[14],
                    "Sat"          => (int)$ar[15],
                    "Sun"          => (int)$ar[16],
                    "presence"          => 1,

                    "inputDate"         => time(),

                );
                $this->db->insert("cso1_promotion", $insert);
                echo "promoHeader INSERT " . $ar[0] . "\n";
            }

            $insert = array(
                "fileName" => $fileName,
                "totalInsert" => $i,
                "lastSycn" => date("Y-m-d H:i:s"),
                "inputDate" => time(),
            );
            $this->db->insert("cso1_sync", $insert);

            fclose($handle);
        }
    }

    function promoDetail()
    {
        $i = 0;
        $fileName = $this->promo_detail;
        $handle = fopen("../sync/$fileName", "r");
        if ($handle) {
            while (($line = fgets($handle)) !== false) {
                $i++;
                $ar =  explode("|", $line);
                $this->db->delete("cso1_promotionItem", "promotionId='$ar[0]' and itemId = '$ar[1]' ");
                $insert = array(
                    "promotionId"   => $ar[0],
                    "itemId"        => $ar[1],
                    "qtyFrom"       =>  (int)$ar[2],
                    "qtyTo"         => (int)$ar[3],
                    "specialPrice"  => (float)$ar[4],
                    "disc1"         => (float)$ar[5],
                    "disc2"         => (float)$ar[6],
                    "disc3"         => (float)$ar[7],
                    "discountPrice" => (float)$ar[8],
                    "status"        => (int)$ar[9],
                    "presence"      => 1,
                    "inputDate"     => time(),

                );
                $this->db->insert("cso1_promotionItem", $insert);
                echo "promoDetail INSERT " . $ar[0] . "\n";
            }

            $insert = array(
                "fileName" => $fileName,
                "totalInsert" => $i,
                "lastSycn" => date("Y-m-d H:i:s"),
                "inputDate" => time(),
            );
            $this->db->insert("cso1_sync", $insert);

            fclose($handle);
        }
    }

    function promoFree()
    {
        $i = 0;
        $fileName = $this->promo_free;
        $handle = fopen("../sync/$fileName", "r");
        if ($handle) {
            while (($line = fgets($handle)) !== false) {
                $i++;
                $ar =  explode("|", $line);
                $this->db->delete("cso1_promotionFree", "promotionId='$ar[0]' and itemId = '$ar[1]' ");
                $insert = array(
                    "promotionId"   => $ar[0],
                    "itemId"        => $ar[1],
                    "qty"           => (int)$ar[2],
                    "freeItemId"    => $ar[3],
                    "freeQty"       => (int)$ar[4],
                    "applyMultiply"  => (int)$ar[5],
                    "scanFree"       => (int)$ar[6],
                    "printOnBill"    => (int)$ar[7],
                    "status"        => (int)$ar[8],
                    "presence"      => 1,
                    "inputDate"     => time(),

                );
                $this->db->insert("cso1_promotionFree", $insert);
                echo " promoFree INSERT " . $ar[0] . "\n";
            }

            $insert = array(
                "fileName" => $fileName,
                "totalInsert" => $i,
                "lastSycn" => date("Y-m-d H:i:s"),
                "inputDate" => time(),
            );
            $this->db->insert("cso1_sync", $insert);

            fclose($handle);
        }
    }

    function transactionToTxt()
    {
    }
  

}
