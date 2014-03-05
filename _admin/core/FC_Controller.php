<?php 
    if(!defined('BASEPATH')) exit('No direct script access allowed');

class FC_Controller extends CI_Controller {  
    
    function __construct(){
        parent::__construct();
        $this->_logIn(); 
    }                   
        
// Sprawdzanie czy zalogowany i czy posiada odpowiednie uprawnienia
    function _logIn(){
        if(!$this->ion_auth->logged_in()){                                        
            if($this->uri->uri_string() != "dashboard/sign_in")
                redirect('dashboard/sign_in', 'refresh'); 
        }
        elseif(!$this->ion_auth->is_admin()){
            show_error($this->lang->line("felis_login_must_admin"));
        }    
    }   
                     
}