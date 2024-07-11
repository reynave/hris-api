<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Cmd extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

    }
    // CALL cmd : php index.php Cmd
    function index()
    {
        $fileName = 'users.csv';

        $file = new SplFileObject("./uploads/$fileName", 'r');
        $file->seek(PHP_INT_MAX);
        $file->key();

        if ($file->key() > 0) {

            $handle = fopen("./uploads/$fileName", "r");
            if ($handle) {
                while (($line = fgets($handle)) !== false) {
                    $ar = explode(",", $line); 
                    $insert = array(
                        "id" => $ar[0],
                        "name" => $ar[2],
                        "phone" => $ar[3],
                        "email" => $ar[4],
                        "password" => md5($ar[0]),
                        "address" => $ar[10],
                       // "idNumber" => $ar[17],

                        "status" => 1,
                        "presence" => 1,
                        "inputDate" => date("Y-m-d H:i:s"),
                        "updateDate" => date("Y-m-d H:i:s"),
                    );
                      $this->db->insert("personal", $insert);
                    print_r($insert);
                }
                fclose($handle);
            }
        } else {
            echo "\n $fileName NO DATA";
        }
    }

    function employed()
    {
        $fileName = 'users.csv';

        $file = new SplFileObject("./uploads/$fileName", 'r');
        $file->seek(PHP_INT_MAX);
        $file->key();

        if ($file->key() > 0) {

            $handle = fopen("./uploads/$fileName", "r");
            if ($handle) {
                while (($line = fgets($handle)) !== false) {
                    $ar = explode(",", $line); 
                    $insert = array(
                        "id" => "EM".$ar[0],
                        "personalId" => $ar[0], 
                        "status" => 1,
                        "presence" => 1,
                        "inputDate" => date("Y-m-d H:i:s"),
                        "updateDate" => date("Y-m-d H:i:s"),
                    );
                    $this->db->insert("employment", $insert);
                    print_r($insert);
                }
                fclose($handle);
            }
        } else {
            echo "\n $fileName NO DATA";
        }
    }

}
