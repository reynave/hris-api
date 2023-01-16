<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Dashboard extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->openAPI = $this->db->openAPI;
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: key, token,  Content-Type");
        header('Access-Control-Allow-Methods: GET, POST, PUT');
        header('Content-Type: application/json');
        // error_reporting(E_ALL);  
        if (!$this->model->header($this->openAPI)) {
            //    echo $this->model->error("Error auth");
            //   exit;
        }
    }
    // START :: ITEMS
    function storeBranches()
    {

        $storeBrands = [];
        foreach ($this->model->sql("SELECT * from cso1_storeBrands where presence = 1 order by name ASC") as $row) {
         
            $storeBranches = [];
            foreach ($this->model->sql("SELECT  storeBrandsId, id, name
            from cso1_storeBranches where storeBrandsId = '" . $row['id'] . "' and presence = 1 order by name ASC") as $row2) {
                array_push($storeBranches, $row2);
            } 
            $temp = array(
                "brand" => "[" . $row['id'] . "] " . ($row['name'] == null ? $row['id'] : $row['name']),
                "detail" => $storeBranches, 
            );
            array_push($storeBrands, $temp);
        }


        $data = array(
            "storeOutles" => $this->input->get('storeBranchesId') ?  $this->model->sql("SELECT id, name 
            from cso1_storeOutles where storeBranchesId = '" . $this->input->get('storeBranchesId') . "' and presence = 1 order by name ASC") : [],

            "storeBranches" => $storeBrands,
            "dateFrom" => date('Y-m-d'),
            "dateTo" => date('Y-m-d'),
        );
        echo json_encode($data);
    }

    function storeOutles($storeBranchesId = "")
    {
        $data = array(
            "storeOutles" => $this->model->sql("SELECT id, name from cso1_storeOutles where storeBranchesId = '$storeBranchesId' and  presence = 1 order by name ASC"),
        );
        echo json_encode($data);
    }


    function salesDashboard()
    {
        $where = "and t.storeOutlesId = '" . $this->input->get('storeOutletId') . "' 
        and (t.transactionDate  >=  " . strtotime($this->input->get('dateFrom')) . " and t.transactionDate <= " . strtotime($this->input->get('dateTo')) . ")";

        $w = "and storeOutlesId = '" . $this->input->get('storeOutletId') . "' 
        and (transactionDate  >=  " . strtotime($this->input->get('dateFrom')) . " and transactionDate <= " . strtotime($this->input->get('dateTo')) . ")";


        $salesByBranches = $this->model->sql("SELECT t.sales, b.name
        from (
            select   sum(t.finalPrice) as 'sales', o.storeBranchesId
            from cso1_transaction as t
            join cso1_storeOutles as o on o.id = t.storeOutlesId
            where t.presence = 1 $where
            group by o.storeBranchesId) as t
        join cso1_storeBranches as b on b.id = t.storeBranchesId");


        $salesByBranchesObj = [];
        foreach ($salesByBranches as $row) {
            array_push($salesByBranchesObj, [
                $row['name'],  $row['sales'],
            ]);
        }


        $salesVisitor = $this->model->sql("SELECT CAST(DATEADD(SECOND, transactionDate
            ,'1970/1/1') AS DATE) as 'date'  ,
                SUM(CASE WHEN memberId != '0' THEN finalPrice ELSE 0 END) as 'member',
                SUM(CASE WHEN memberId = '0' THEN finalPrice ELSE 0 END) as 'nonMember',
                count(transactionDate) as 'qty'
                from cso1_transaction 
            where presence = 1 
            $w 
            group by CAST(DATEADD(SECOND, transactionDate
                ,'1970/1/1') AS DATE)
                order by CAST(DATEADD(SECOND, transactionDate
        ,'1970/1/1') AS DATE) ASC
        ");
        $salesVisitorObj = [];
        $totalMember = 0;
        $totalNonMember = 0;
        $totalQty = 0;
        foreach ($salesVisitor as  $row) {
            array_push($salesVisitorObj, [
                $row['date'],  $row['member'],  $row['nonMember']
            ]);

            $totalMember += $row['member'];
            $totalNonMember += $row['nonMember'];
            $totalQty  += $row['qty'];
        }

        $paymentWhere = "";
        foreach ($this->model->sql("SELECT * from cso1_paymentType where presence = 1") as $row) {
            $paymentWhere .= " SUM(CASE WHEN paymentTypeId = '" . $row['id'] . "' THEN finalPrice ELSE 0 END) as '" . $row['name'] . "', ";
        }

        $sql = "SELECT CAST(DATEADD(SECOND, transactionDate
        ,'1970/1/1') AS DATE) as 'date'  ,
             $paymentWhere 
         count(transactionDate) as 'qty'
        from cso1_transaction 
       where presence = 1   $w 
       group by CAST(DATEADD(SECOND, transactionDate
        ,'1970/1/1') AS DATE) 
        order by CAST(DATEADD(SECOND, transactionDate
        ,'1970/1/1') AS DATE) ASC
       ";
       
        $salesPayment =  $this->model->sql($sql);
        $salesPaymentObj = [];
        $salesPaymentColumnsObj = [];


        $paymentTotalWhere = "";
        foreach ($this->model->sql("SELECT * from cso1_paymentType where presence = 1") as $row) {
            $paymentTotalWhere .= " SUM(a.[" . $row['name'] . "]) as '".$row['name']."', ";
        }

        $sql2 = "SELECT  $paymentTotalWhere  sum(a.qty) as 'qty' from (SELECT CAST(DATEADD(SECOND, transactionDate
        ,'1970/1/1') AS DATE) as 'date',
             $paymentWhere 
         count(transactionDate) as 'qty'
            from cso1_transaction 
            where presence = 1   $w 
            group by CAST(DATEADD(SECOND, transactionDate
        ,'1970/1/1') AS DATE) ) as a
       ";

        
        
        foreach ($salesPayment as  $row) {
            $temp = [];
            $salesPaymentColumnsObj = [];
            foreach ($row  as $x => $val) {
                if ($x != "qty") {
                    array_push($temp, $val);
                    array_push($salesPaymentColumnsObj, $x);
                }
            } 
            array_push($salesPaymentObj, $temp);
        }
 

        $data = array(
            "dateFrom" => strtotime($this->input->get('dateFrom')),
            "dateTo" => strtotime($this->input->get('dateTo')),
            "salesByBranches" => $salesByBranches,
            "salesByBranchesObj" => $salesByBranchesObj,

            "salesVisitor" => $salesVisitor,
            "salesVisitorObj" => $salesVisitorObj,
            "salesVisitorTotal" => array(
                "member" =>  $totalMember,
                "nonMember" =>  $totalNonMember,
                "qty" =>  $totalQty
            ),
            "salesPayment" => $salesPayment,
            "salesPaymentObj" => $salesPaymentObj,
            "salesPaymentColumnsObj" => $salesPaymentColumnsObj, 
            "salesPaymentTotal" => $this->model->sql($sql2),
        );
        echo json_encode($data);
    }

    function topten()
    {
        $where = "and t.storeOutlesId = '" . $this->input->get('storeOutletId') . "' 
        and (t.transactionDate  >=  " . strtotime($this->input->get('dateFrom')) . " and t.transactionDate <= " . strtotime($this->input->get('dateTo')) . ")";

        $w = "and storeOutlesId = '" . $this->input->get('storeOutletId') . "' 
        and (transactionDate  >=  " . strtotime($this->input->get('dateFrom')) . " and transactionDate <= " . strtotime($this->input->get('dateTo')) . ")";


        $topItem = $this->model->sql("SELECT t1.*, i.description FROM (
                select top 10 td.itemId, sum(td.price) as 'sales' 
                from cso1_transaction as t
                join cso1_transactionDetail as td on td.transactionId = t.id 
                where t.presence  = 1 and   td.presence = 1 $where 
                group by td.itemId) as t1
            join cso1_item as i on t1.itemId = i.id
            order by t1.sales DESC
        ");
        $topItemObj = [];
        foreach ($topItem  as $row) {
            array_push($topItemObj, [
                $row['description']  ? $row['description'] : "Untitle",  $row['sales'],
            ]);
        }


        $topCategory = $this->model->sql("SELECT t1.*, c.name from (
                select top 10 i.itemCategoryId, sum(td.price) as 'sales'
                from cso1_transaction as t
                join cso1_transactionDetail as td on t.id = td.transactionId
                join cso1_item as i on i.id = td.itemId
                where t.presence = 1  $where 
                group by i.itemCategoryId) as t1
            left join cso1_itemCategory as c on c.id = t1.itemCategoryId
            order by t1.sales DESC
        ");

        $topCategoryObj = [];
        foreach ($topCategory  as $row) {
            array_push($topCategoryObj, [
                $row['name'] ?  $row['name'] : "Untitle",  $row['sales'],
            ]);
        }

        $data = array(
            "dateFrom" => strtotime($this->input->get('dateFrom')),
            "dateTo" => strtotime($this->input->get('dateTo')),
            "topItemObj" => $topItemObj,
            "topItem" =>   $topItem,
            "topCategoryObj" => $topCategoryObj,
            "topCategory" => $topCategory,
        );
        echo json_encode($data);
    }
}
