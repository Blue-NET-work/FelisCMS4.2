<?php  
  class Dotpay extends CI_Model{

    public function __construct(){
        parent::__construct(); 
    } 
       
   public static function dotpay_weryfikuj(){
       if(isset($_POST['premsubmit'])){
            $id = 1234; // Podaj swój indetyfikator
            $code= ''; // Podaj swoje kody
            $type= 'c1,sms'; // Podaj typy usług
         
            if(!$_POST['code']) $error[] = 'Nie wprowadzono kodu aktywacyjnego';
            else{
                $handle = fopen('http://dotpay.pl/check_code.php?id=' . $id . '&code=' . $code . '&check=' . $_POST['code'] . '&type=' .$type . '&del=' . $del, 'r');
                $status = fgets($handle, 8);
                $czas_zycia = fgets($handle, 24);
                fclose($handle);
                $czas_zycia = rtrim($czas_zycia);
                if(!$status) $error[] = 'Podano niepoprawny kod usługi';
                else
                {
                    // Jeżeli kod jest poprawny
                }
            }
        }
   }
  
}
?>
