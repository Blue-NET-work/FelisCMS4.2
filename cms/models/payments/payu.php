<?php  
  class PayU extends CI_Model{

    public function __construct(){
        parent::__construct(); 
    } 
       
   public static function payu_sprawdzenie($p24_id_sprzedawcy, $p24_session_id, $p24_order_id, $p24_crc, $p24_kwota=""){ 
        $url = "https://secure.payu.pl";    
        $P[] = "p24_id_sprzedawcy=" . $p24_id_sprzedawcy;
        $P[] = "p24_session_id=" . $p24_session_id;
        $P[] = "p24_order_id=" . $p24_order_id;
        $P[] = "p24_crc=" . md5($p24_session_id."|".$p24_order_id."|".$p24_kwota."|".$p24_crc);
        
        if ($p24_kwota != "") $P[] = "p24_kwota=" . $p24_kwota;
        
        $H = array();
        
        $user_agent = "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        if (count($P))
            curl_setopt($ch, CURLOPT_POSTFIELDS, join("&", $P));
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
        if (count($H))
            curl_setopt($ch, CURLOPT_HTTPHEADER, $H);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        $result = curl_exec($ch);
        curl_close($ch);
        $T = explode(chr(13) . chr(10), $result);
        
        foreach ($T as $line) {
            $line = preg_replace("[\n\r]", "", $line);
            if ($line != "RESULT" and !@$res)
                continue;
            if (@$res)
                $RET[] = $line;
            else
                $res = true;
        }
        
        if(isset($RET[0]) && $RET[0] == 'TRUE'){
            return true;
        }
        return false;    
   }
  
}
?>
