<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Ecr extends CI_Model
{

    function __construct()
    {
        /* Call the Model constructor */ 
        parent::__construct();
    }



    function fnXor($str  = [])
    {
        $bit = self::strToBit($str);
        $xor = "";
        $resp = [];

        $data =  array_fill(0, count($bit), 0);
        $data[0] = sprintf("%08d", decbin(0x1));
        $data[1] = sprintf("%08d", decbin(0x50));
        $data[2] = sprintf("%08d", decbin(0x2));
        $i = 3;

        foreach ($bit as $arr) {
            $data[$i] = $arr;
            $i++;
        }
        $data[$i] = sprintf("%08d", decbin(0x3));

        $sum =  array_fill(0, 8, 0);

        foreach ($data as $arr) {
            $a = str_split($arr);
            for ($i = 0; $i < 8; $i++) {
                $sum[$i] += $a[$i];
            }
        }
        for ($i = 0; $i < 8; $i++) {
            $sum[$i] = $sum[$i] % 2;
        }


        for ($i = 0; $i < 8; $i++) {
            $sum[$i] = $sum[$i] % 2;
            $xor .= $sum[$i];
        }

        $char = bindec($xor);
        $char = dechex($char);
       // $char = sprintf("%02d", $char);

        return $char;
    }



    function strToBit($str )
    {
        $resp = [];
        foreach (str_split($str) as  $arr) {
            $bin = sprintf("%08d", decbin(ord($arr))); // "00011010"
            array_push($resp, $bin);
        }
        return $resp;
    }
}
