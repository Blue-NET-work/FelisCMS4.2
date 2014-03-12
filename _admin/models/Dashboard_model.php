<?php
class Dashboard_model extends CI_Model{

    public function __construct(){                
        parent::__construct(); 
    }             
    
// Ustawienie języka dla użytkownika        
    public function languageSet($lang = false){
        if($lang != FC_Request::language()){
            $this->session->set_userdata(array('user_lang'=>$lang));        
            $this->config->set_item('language', $lang);
            return true;
        }  
    }
     
}