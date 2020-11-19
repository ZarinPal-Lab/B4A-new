<?php
    if(isset($_GET['SECRET']) or isset($_POST['SECRET'])){
        if ($_GET['SECRET'] == '5sdc6vfEVf32dsv3s51w6es6sv2' or $_POST['SECRET'] == '5sdc6vfEVf32dsv3s51w6es6sv2'){
            if(isset($_GET['Amount']) or isset($_POST['Amount'])){
                if(isset($_GET['MerchantID']) or isset($_POST['MerchantID'])){
                    if (isset($_GET['SECRET'])){
                        $Amount = $_GET['Amount'];
                        $Authority = $_GET['Authority'];
                        $MerchantID = $_GET['MerchantID'];
                    }else if (isset($_POST['SECRET'])){
                        $Amount = $_POST['Amount'];
                        $Authority = $_POST['Authority'];
                        $MerchantID = $_POST['MerchantID'];
                    }
                    $client = new SoapClient('https://www.zarinpal.com/pg/services/WebGate/wsdl', ['encoding' => 'UTF-8']);
                    $result = $client->PaymentVerification(['MerchantID' => $MerchantID,'Authority' => $Authority,'Amount' => $Amount,]);
                    $a = array();
                    ///You can Write your code here. you can save Your History Payment or ....
                    //You have:
                    //$result->Status       (Status)
                    //$result->RefID        (Code Payment)
                    //$Amount               (Money Payed)
                    //$_GET['Authority']    (Secret Code)
                    //$_GET['MerchantID']   (Your MerChand ID)
                    //$_GET['DataSend']     (Your Extra Data (Map And JSON Format))
					//
					// ageh $result->Status barabar bod ba 100 yani pardakht anjam shode. ageh 101 bode yani pardakht ghablan pardakht shodeh
                    array_push($a,array('status' =>  $result->Status ,'CodePay' =>$result->RefID));
                    echo json_encode($a);
                }else{
                    echo 'Error Sec3';
                }
            }else{
              echo 'Error Sec2';
            }
        }else{    
            echo 'Error Sec1';
        }
    }else{
        echo 'Error Sec0';
    }
?>