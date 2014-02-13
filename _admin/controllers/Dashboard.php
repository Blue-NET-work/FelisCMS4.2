<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct(){
        parent::__construct();  
        @FC_Request::loadModel('admin_model');                                                                        
    }
                                  
    public function index(){               
        
        //Wczytanie domyślnego stylu         
        @Admin_model::defaultStyle();                                                           
        @View::setCSS(templates_url('assets/css/felis/felis.agenda.css'));   
        @View::setCSS(templates_url('assets/css/felis/felis.dashboard.css'));           
        /* Wczytanie domyślnych JS'ów */                                                   
        @View::setJQ(templates_url("assets/js/felis/felis.agenda.js"));    
                                        
        @FC_Request::loadLang("felis_dashboard"); 
        @FC_Request::loadModel('dashboard_model');  
                                                     
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
    public function sign_up(){                    
        $this->form_validation->set_error_delimiters("","<span style='padding-right:5px;'></span>");
           
        if ($this->ion_auth->logged_in()){redirect('dashboard', 'refresh');}
                                                                             
        /* Wczytanie domyślnych CSS'ów */                                                                 
        @View::setCSS(templates_url('public/css/bootstrap/bootstrap.css'));    
        @View::setCSS(templates_url('public/css/bootstrap/bootstrap-theme.css'));    
        @View::setCSS(templates_url('public/css/styles/logowanie.css'), "text/css");  
        @View::setCSS(templates_url('public/css/icons/woocons.css'), "text/css"); 
         
        @View::setJQ(base_url()); 
                                                                                                                 
                                                                          
        @FC_Request::loadLang("felis_login");                   
        
        if($this->session->flashdata('message')){
            $msg = $this->session->flashdata('message');  
            if(isset($msg['text']))$messages = $msg;
            else $messages = array('boxClass' => "alert-danger", 'icon'=>"woocons-stop-2 woocons-size32", 'text'=>"{$msg}");                                 
        }
        else $messages = array('boxClass' => "alert-info", 'icon'=>"woocons-light-bulb-on woocons-size32", 'text'=>$this->lang->line("login_require_a_login")); 
                                                                                                                       
        if(@FC_Request::post('item')){                                                                                   
                                   
            $this->form_validation->set_rules('item[login]', 'lang:login_username', 'required');
            $this->form_validation->set_rules('item[password]', 'lang:login_password', 'required');
                
            if ($this->form_validation->run() == true){    
                $item = @FC_Request::post('item');                                        
                $remember = (bool) $item['remember'];
                                                    
                if ($this->ion_auth->login($item['login'], $item['password'], $remember)){     
                    $this->session->set_flashdata('message', $this->ion_auth->messages());
                    $redirect = index_page();
                    if($this->session->flashdata('redirect')) $redirect = $this->session->flashdata('redirect');
                    redirect($redirect, 'refresh');
                }
                else{                                           
                    $this->session->set_flashdata('message', $this->ion_auth->errors());
                    redirect('dashboard/login', 'refresh');
                }                                
            }
            else{      
                $system_messages = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
                $messages = array('boxClass' => "alert-danger", 'icon'=>"woocons-stop-2 woocons-size32", 'text'=>"{$system_messages}", 'action'=>"shake");                          
            }
        }
                                                      
        $query["messages"] = $messages;    
        @FC_Request::smartyView("account/sign_up.tpl", $query);
    }
    
// Wylogowanie
    public function logout(){     
        $logout = $this->ion_auth->logout();  
        $messages = array('boxClass' => "alert-success", 'icon'=>"woocons-light-bulb-off woocons-size32", 'text'=>$this->ion_auth->messages());          
        $this->session->set_flashdata('message', $messages);
        redirect('dashboard/sign_up', 'refresh');
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