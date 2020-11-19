<?php
    if(isset($_GET['Amount'])&&isset($_GET['SECRET'])&&isset($_GET['Start_with'])&&isset($_GET['Description'])&&isset($_GET['MerchantID'])){
        if ($_GET['SECRET'] == 'As44sdSdfeiufsdf54sdf84cs'){
            $MerchantID = $_GET['MerchantID'];
            $Amount = $_GET['Amount']; 
            $Description =$_GET['Description'] ;
            $Email = $_GET['Email'] ;
            $Mobile = $_GET['Mobile'];
            $Start_with = $_GET['Start_with'];
            $DataSend = $_GET['DataSend'];
            $CallbackURL = $Start_with."/Verify.php/?SECRET=5sdc6vfEVf32dsv3s51w6es6sv2&Amount=".$Amount."&MerchantID=".$_GET['MerchantID']."&DataSend=".$DataSend;
            $client = new SoapClient('https://www.zarinpal.com/pg/services/WebGate/wsdl', ['encoding' => 'UTF-8']);
            $result = $client->PaymentRequest(
            [
                'MerchantID' => $MerchantID,
                'Amount' => $Amount,
                'Description' => $Description,
                'Email' => $Email,
                'Mobile' => $Mobile,
                'CallbackURL' => $CallbackURL,
            ]
            );
            if ($result->Status == 100) {
                Header('Location: https://www.zarinpal.com/pg/StartPay/'.$result->Authority);
            } else {
                echo'Error: '.$result->Status;
            }
        }else{
          echo 'Error Sec0';
        }
    }else{
       echo 'PHP Error';
    }
?>