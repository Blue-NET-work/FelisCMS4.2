<?php

class FC_MAIL {
    
    
    
//    
//    
//    
//    
//    
//    
//    
// STARE    
//    
//    
//    
//    
//    
//    
//    
    
    private function __setting($smtp){
        if($smtp["smtp"] == "TRUE"){
            // Protokół wysyłania wiadomości
            $config['protocol'] = 'smtp';   
            $config['smtp_host']    = $smtp["smtp_host"]; // SMTP Server Address.
            $config['smtp_user']    = $smtp["smtp_username"]; // SMTP Username.
            $config['smtp_pass']    = $smtp["smtp_password"]; // SMTP Password.
            $config['smtp_port']    = $smtp["smtp_port"]; // SMTP Port.
            $config['smtp_timeout'] = 10; // SMTP Timeout (in seconds).
        }
        else{
            // Protokół wysyłania wiadomości
            $config['protocol'] = 'sendmail';
            $config['mailpath'] = '/usr/sbin/sendmail';
        }
        
            $config['useragent'] = 'FelisCMS'; // Protokół tworzenia wiadomości text // html
            $config['mailtype']  = 'html'; // Protokół tworzenia wiadomości text // html
            $config['charset']   = 'utf-8'; // Kodowanie wiadomości
            $config['validate']  = TRUE; // walidacja adresu email
            $config['priority']  = 3; // Wartości 1, 2, 3, 4, 5    Email Priority. 1 = bardzo wysoki. 5 = niski 3 = normalny.
            $config['wordwrap']  = TRUE;

        $this->email->initialize($config);        
    }
    
// Wysyłanie maila    
    public function send_mail($smtp, $email){
        
        FC_MAIL::__setting($smtp);
        
        if($smtp["smtp_auth"] == "TRUE"){
            $this->email->from($smtp["smtp_email"], $smtp["smtp_from"]);
            $this->email->reply_to($smtp["service_email"], $smtp["service_owner_name"]);
        }
        else{
            $this->email->from($smtp["service_email"], $smtp["service_owner_name"]);
            $this->email->reply_to($smtp["service_email"], $smtp["service_owner_name"]);
        }
                
        $this->email->to($email["mail"]);  
        $this->email->subject($email["title"]);
        $this->email->message($email["message"]);    
        return $this->email->send();
    }
    
// Wysyłanie maila    
    public function contact($smtp, $email){
        
        FC_MAIL::__setting($smtp);
        
        if($smtp["smtp_auth"] == "TRUE"){
            $this->email->from($smtp["smtp_email"], $smtp["smtp_from"]);
            $this->email->reply_to($email["email"], $email["name"]);
        }
        else{
            $this->email->from($email["email"], $email["name"]);
            $this->email->reply_to($email["email"], $email["name"]);
        }
        
        $this->email->to($smtp["service_email"], $smtp["service_owner_name"]);  
        if($email["copy"] != FALSE){$this->email->cc($email["email"], $email["name"]);} 
        $this->email->subject($email["title"]);
        $this->email->message($email["message"]);    
        return $this->email->send();
    }
// Pobieranie danych do smtp    
    public function smtp(){
        if(FC_DB::getDataSelect('*','config', "`name` = 'smtp'") == "TRUE"){ 
            $smtp["smtp"]           = FC_DB::getDataSelect('*','config', "`name` = 'smtp'"); // Używanie SMTP  TRUE lub FALSE
            $smtp["smtp_auth"]      = FC_DB::getDataSelect('*','config', "`name` = 'smtp_auth'"); // Autoryzacja SMTP
            $smtp["smtp_ssl"]       = FC_DB::getDataSelect('*','config', "`name` = 'smtp_ssl'");  // Certyfikat SSL dla SMTP
            $smtp["smtp_from"]      = FC_DB::getDataSelect('*','config', "`name` = 'smtp_from'"); // Nazwa dla SMTP
            $smtp["smtp_email"]     = FC_DB::getDataSelect('*','config', "`name` = 'smtp_email'"); // Adres e-mail dla SMTP
            $smtp["smtp_host"]      = FC_DB::getDataSelect('*','config', "`name` = 'smtp_host'");  // Host SMTP
            $smtp["smtp_username"]  = FC_DB::getDataSelect('*','config', "`name` = 'smtp_username'"); // Użytkownik SMTP
            $smtp["smtp_password"]  = FC_DB::getDataSelect('*','config', "`name` = 'smtp_password'"); // Hasło SMTP
            $smtp["smtp_port"]      = FC_DB::getDataSelect('*','config', "`name` = 'smtp_port'");  // Port SMTP
            $smtp["service_email"]  = FC_DB::getDataSelect('*','config', "`name` = 'service_email'");  // Adres e-mial nadawcy
            $smtp["service_owner_name"]= FC_DB::getDataSelect('*','config', "`name` = 'service_owner_name'");  // Nazwa nadawcy
        }
        else{
            $smtp["service_email"]     = FC_DB::getDataSelect('*','config', "`name` = 'service_email'");  // Adres e-mial nadawcy
            $smtp["service_owner_name"]= FC_DB::getDataSelect('*','config', "`name` = 'service_owner_name'");  // Nazwa nadawcy
        }
        return $smtp;
    }
}