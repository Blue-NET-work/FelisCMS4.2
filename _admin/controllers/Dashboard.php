<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends FC_Controller {

    function __construct(){
        parent::__construct();  
        @FC_Request::loadModel('Admin_model');                                                             
    }
                                  
    public function index(){               
        
        //Wczytanie domyślnego stylu         
        //@Admin_model::defaultStyle();                                                           
        //$this->smarty->setCSS(templates_url('assets/css/felis/felis.agenda.css'));   
        //@View::setCSS(templates_url('assets/css/felis/felis.dashboard.css'));           
        /* Wczytanie domyślnych JS'ów */                                                   
        //@View::setJQ(templates_url("assets/js/felis/felis.agenda.js"));    
                                        
        //@FC_Request::loadLang("felis_dashboard"); 
        //@FC_Request::loadModel('dashboard_model');  
                                                     
        @FC_Request::smartyView("index.tpl");
    }         
    
    public function source(){             
        Admin_model::defaultStyle();     
        @FC_Request::smartyView("source.tpl");
    }  

/*
 *
 * Autoryzacja użytkownika
 * logowanie, wylogowanie itp.
 *
 */   

// Logowanie    
    public function sign_in(){                    
        $this->form_validation->set_error_delimiters("","<span style='padding-right:5px;'></span>");
        
        @FC_Request::loadLang("felis_login"); 
           
        if ($this->ion_auth->logged_in()){redirect('dashboard', 'refresh');}    
                                                                                                                         
        if(@FC_Request::post('item')){                                                                                   
                                   
            $this->form_validation->set_rules('item[login]', 'lang:felis_login_username', 'required');
            $this->form_validation->set_rules('item[password]', 'lang:felis_login_password', 'required');
                
            if ($this->form_validation->run() == true){    
                $item = @FC_Request::post('item');                                        
                $remember = (bool) $item['remember'];
                                                    
                if ($this->ion_auth->login($item['login'], $item['password'], $remember)){
                    $respond["logged"] = true;
                    $respond["messages"] = $this->ion_auth->messages();                                           
                    $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond));  
                }
                else{                         
                    $respond["messages"] = $this->ion_auth->errors();                                               
                    $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond)); 
                }                                
            }
            else{      
                $respond["messages"] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');                               
                $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond));                         
            }
        }
        else{                                                         
            
            if($this->session->flashdata('message'))
                $messages = $this->session->flashdata('message');  
            else 
                $messages = $this->lang->line("felis_login_require_a_login"); 
                                            
            @View::setCSS(base_url());                                                                                                  
                                                
            @View::setJQ(base_url());
            
            $query["messages"] = $messages;    
            @FC_Request::smartyView("account/sign_in.tpl", $query);
        }             
                                                                
    }
    
    public function ajax_sign_in(){
        $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode("Odezwałem się!"));
    }
    
// Wylogowanie
    public function logout(){     
        $logout = $this->ion_auth->logout();   
        $this->session->set_flashdata('message', $this->ion_auth->messages());
        //redirect('dashboard/sign_in', 'refresh');
    }

    public function test(){
        $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode());
        //$query["messages"] = false;
        //$this->smarty->viewReturn("ajax/register.tpl", $query, FALSE);
    }
                      
/********************
*   Change Languages
********************/ 

    public function language($lang){    
        $referer = @FC_Request::server("HTTP_REFERER");                 
        @FC_Request::languageSet($lang);    
        $response["success"] = lang("default_success");
        $response["success_msg"] = lang("default_laguage_success");
        $response["error"] = lang("default_error");                  
        $response["error_msg"] = lang("default_laguage_error");
        $response["status"] = "ok";
        $response["templates_url"] = templates_url();
        $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));                         
        //redirect($referer, 'refresh', "5");
    }    
                              
}            