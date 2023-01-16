<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Transaction extends CI_Model
{

    function __construct()
    {
        /* Call the Model constructor */
        parent::__construct();
    }
    function sync($a = "")
    {
        if ($a == '') {
            $date = date("Y-m-d");
        } else {
            $date = date($a);
        }
        echo "\n";
        echo self::postraheader($date) . "\n";
        echo self::postrasalesitem($date) . "\n";
        echo self::postratender($date) . "\n";
    }

    function postraheader($date)
    {
        $ymd = date("ymd", strtotime($date));
        $year = date("Y", strtotime($date));
        $month = date("m", strtotime($date));
        $day = date("d", strtotime($date));

        $fileName = "POSTRAHEADER$ymd.txt";
        $myfile = fopen("../sync/transaction/$fileName", "w") or die("Unable to open file!");

        $sql = "SELECT * from cso1_transaction  
        where   year(endDate) = '$year' and  month(endDate) = '$month' and day(endDate) = '$day'
        and presence = 1";
        //echo   "\n" . $sql . "\n" . "\n";
        $i = 0;
        foreach ($this->model->sql($sql) as $row) {
            $i++;
            $txt = date("d/m/Y H:i:s", strtotime($row['startDate'])) . "|" .
                date("d/m/Y H:i:s", strtotime($row['endDate'])) . '|' .
                date("d/m/Y", strtotime($row['endDate'])) . '|' .
                '"' . $row['storeOutlesId'] . '"|' .
                '"' . $row['terminalId'] . '"|' .
                '"' . $row['id'] . '"|' .
                '""' . '|' .
                $row['memberId'] . '|' .
                $row['finalPrice'] . '|' .
                '0|1' .
                "\n";
            fwrite($myfile, $txt);
        }
        fclose($myfile);

        $fileNameTrg = "postraheader$ymd.trg";
        $myfile = fopen("../sync/transaction/$fileNameTrg", "w") or die("Unable to open file!");
        $txt = "end\n";
        fwrite($myfile, $txt);
        fclose($myfile);


        $insert = array(
            "fileSize" =>  $i,
            "module" => "POSTRAHEADER",
            "fileName" => $fileName,
            "status" => 1, 
            "presence" => 1, 
             "syncDate" => date("Y-m-d H:i:s"),
            "inputDate" => time(),
        );
        $this->db->insert("cso1_syncLog", $insert);
        return "POSTRAHEADER CREATED " . $ymd;
    }

    function postrasalesitem($date)
    {
        $ymd = date("ymd", strtotime($date));
        $year = date("Y", strtotime($date));
        $month = date("m", strtotime($date));
        $day = date("d", strtotime($date));

        $fileName = "POSTRASALESITEM$ymd.txt";
        $myfile = fopen("../sync/transaction/$fileName", "w") or die("Unable to open file!");

        $sql = "SELECT s.*, t.terminalId as 'PTSCR',   t.storeOutlesId as 'PTSSITE', t.endDate as 'PTSBUSDATE'
        from ( 
            SELECT 
                td.transactionId as 'PTSTXNUM',  
                count(td.id) as 'PTSQTY',
                sum(td.originPrice) as 'PTSTOTALPRICE',
                sum(td.discount) as 'PTSTOTALDISC',
                td.barcode as 'PTSTILLCODE',
                td.price as 'PTIUNITPRICE',
                td.promotionId as 'PTIPROMOCODE'
            from cso1_transaction as t
            join cso1_transactionDetail as td on td.transactionId = t.id
            where  year(t.endDate) = '$year' and  month(t.endDate) = '$month' and day(t.endDate) = '$day'
            and t.presence = 1 
            group by td.barcode, td.transactionId, td.promotionId, td.price
            ) as s 
        join cso1_transaction as t on t.id = s.PTSTXNUM
        where t.presence = 1";

        //echo   "\n" . $sql . "\n" . "\n";
        $PTSQTY = 1;
        $i = 0;
        $PTSCASHIER = '';
        foreach ($this->model->sql($sql) as $row) {
            $i++;
            $txt =
                $i . '|' .      //1
                $row['PTSTXNUM'] . '|' . //2
                '"' . $row['PTSCR'] . '"|' .   //3
                '"' . $row['PTSSITE'] . '"|' . //4
                $PTSCASHIER . '|' . //5
                date("d/m/Y H:i:s", strtotime($row['PTSBUSDATE'])) . '|' .  //6
                $PTSQTY . '|' . //7
                $row['PTSQTY'] . '|' . //8
                $row['PTSTOTALPRICE'] . '|' . //9
                $row['PTSTOTALDISC'] . '|' . //10
                '"' . $row['PTSTILLCODE'] . '"|' . //11
                '"' . $row['PTIPROMOCODE'] . '"|' . //12
                $row['PTIUNITPRICE'] . '|' . //13  
                $row['USERSPG'] . //14
                "\n";
            fwrite($myfile, $txt);
        }
        fclose($myfile);

        $fileNameTrg = "postrasalesitem$ymd.trg";
        $myfile = fopen("../sync/transaction/$fileNameTrg", "w") or die("Unable to open file!");
        $txt = "end\n";
        fwrite($myfile, $txt);
        fclose($myfile);

        $insert = array(
            "fileSize" =>  $i,
            "module" => "POSTRASALESITEM",
            "fileName" => $fileName, 
            "inputDate" => time(),
            "syncDate" => date("Y-m-d H:i:s"),
            "status" => 1, 
            "presence" => 1, 
        );
        $this->db->insert("cso1_syncLog", $insert);
        return "POSTRASALESITEM CREATED " . $ymd;
    }


    function postratender($date)
    {
        $ymd = date("ymd", strtotime($date));
        $year = date("Y", strtotime($date));
        $month = date("m", strtotime($date));
        $day = date("d", strtotime($date));

        $fileName = "POSTRATENDER$ymd.txt";
        $myfile = fopen("../sync/transaction/$fileName", "w") or die("Unable to open file!");

        $sql = "SELECT *
                from cso1_transaction
                where  year(endDate) = '$year' and  month(endDate) = '$month' and day(endDate) = '$day'
                and presence = 1 
                ";

        //echo   "\n" . $sql . "\n" . "\n"; 
        $i = 0;
        $PTSCASHIER = '';
        foreach ($this->model->sql($sql) as $row) {
            $i++;
            $txt =
                $i . '|' .      //1
                $row['id'] . '|' . //2
                '"' . $row['terminalId'] . '"|' .   //3
                '"' . $row['storeOutlesId'] . '"|' . //4
                $PTSCASHIER . '|' . //5
                $row['paymentTypeId'] . '|' .  //6
                date("d/m/Y H:i:s", strtotime($row['endDate'])) . '|' . //7
                $row['finalPrice'] . '|' . //8
                '|' . //9
                '|' . //10
                '|' . //11
                '1|' . //12 
                "\n";
            fwrite($myfile, $txt);
        }
        fclose($myfile);

        $fileNameTrg = "postratender$ymd.trg";
        $myfile = fopen("../sync/transaction/$fileNameTrg", "w") or die("Unable to open file!");
        $txt = "end\n";
        fwrite($myfile, $txt);
        fclose($myfile);

        $insert = array( 
            "fileSize" =>  $i,
            "module" => "POSTRATENDER",
            "fileName" => $fileName, 
            "inputDate" => time(),
            "syncDate" => date("Y-m-d H:i:s"),
            "status" => 1, 
            "presence" => 1, 
        );
        $this->db->insert("cso1_syncLog", $insert); 

        return "POSTRATENDER CREATED " . $ymd;
    }
}
