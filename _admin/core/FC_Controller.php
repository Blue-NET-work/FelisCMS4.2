<?php 
    if(!defined('BASEPATH')) exit('No direct script access allowed');

class FC_Controller extends CI_Controller {  
    
    public function __construct(){
        parent::__construct();           
        $this->__defined(); 
        $this->__logIn(); 
    }
    
    function __defined(){                  
        $View = new View();   
    }                   
        
// Sprawdzanie czy zalogowany i czy posiada odpowiednie uprawnienia
    function __logIn(){
        if(!$this->ion_auth->logged_in()){                                        
            if($this->uri->uri_string() != "dashboard/sign_up"){                    
                $this->session->set_flashdata('redirect', FC_Request::server("HTTP_REFERER"));
                redirect('dashboard/sign_up', 'refresh');
            }
        }
        elseif(!$this->ion_auth->is_admin()){show_error($this->lang->line("login_must_admin"));}    
    }   
                     
}