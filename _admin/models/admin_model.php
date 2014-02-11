<?php
  class Admin_model extends CI_Model{
    
    public function __construct(){                
        parent::__construct();  
        $this->uri();
        $this->form_validation();
        $this->logIn();
        $this->loadLang();
        $this->userLogIn();
        $this->new_messages_count();      
        $this->new_messages();      
        $this->new_events();    
        $this->adminMenu(); 
    }   
    
// Domyślne wczytywanie języka                
    function loadLang(){                         
        FC_Request::loadLang(array('felis_errors', "felis_info", "felis_default"));
    }   

// Przekazywanie tablicy konstrukcji url          
    function uri(){   
        $uri = $this->uri->segment_array();
        $this->smarty->assign("uri", $uri); 
    }

// Konfiguracja form validatora
    function form_validation(){
        $this->form_validation->set_error_delimiters("<p>","</p>"); 
    }
        
// Sprawdzanie czy zalogowany i czy posiada odpowiednie uprawnienia
    function logIn(){
        if(!$this->ion_auth->logged_in()){                                        
            if($this->uri->uri_string() != "dashboard/sign_up"){                    
                $this->session->set_flashdata('redirect', FC_Request::server("HTTP_REFERER"));
                redirect('dashboard/sign_up', 'refresh');
            }
        }
        elseif(!$this->ion_auth->is_admin()){show_error($this->lang->line("login_must_admin"));}    
    } 
    
// Przekazywanie danych zalogowanego użytkownika
    function userLogIn(){
        if($this->ion_auth->logged_in()){     
            $_avatar = base_url("public/img/lay/user.png"); 
            $_user = $this->ion_auth->user()->row();
            if($_user->avatar) $_avatar = base_url("../uploads/avatar/{$_user->avatar}");
            $_group = FC_DB::getWhereJoinOrder('users_permissions', 'users_groups', 'up_group_id = ug_id', array('up_user_id'=>$_user->id), "`up_group_id` DESC");   
            $userLogIn = array(                   
                'first_name' => $_user->first_name,
                'last_name'  => $_user->last_name,
                'avatar'     => $_avatar,
                'high'       => $_group["ug_description"]   
            );              
            $this->smarty->assigns("userLogIn", $userLogIn);
        } 
    }

// Sprawdzanie czy są nowe wiadomości i ich liczenie 
    function new_messages_count(){
        $messages_count = false;
        $this->smarty->assigns("messages_count", $messages_count);
    }
        
// Wyświetlanie nowych wiadomości
    function new_messages(){
        $newMessages = false;
        $this->smarty->assigns("newMessages", $newMessages); 
    }
        
// Wyświetlanie dzisiejszych wydarzeń
    function new_events(){   
        $eventsToday = false;
        $this->smarty->assigns("eventsToday", $eventsToday);                                
    }
    
// Konfiguracja menu PaneliAdministracyjnego
    function adminMenu(){
        $adminMenu = array('pages'=>1, 'articles'=>1, 'galleries'=>1, 'statistic'=>1,'calendar'=>1,'mailing'=>1,'shop'=>1,'layout'=>1,'settings'=>1,'users'=>1);    
        $this->smarty->assigns("adminMenu", $adminMenu); 
    }  
    
// Domyślny styl 
    function defaultStyle(){  
        /* Wczytanie domyślnych CSS'ów */                                                               
        View::setCSS(base_url().'public/css/bootstrap/bootstrap.css'); 
        View::setCSS(base_url().'public/css/bootstrap/bootstrap-theme.css');  
        View::setCSS(base_url().'public/css/styles.css');            
        View::setCSS(base_url().'public/css/colors.css');                     
        View::setCSS(base_url().'public/css/print.css', "text/css", "print");   
        View::setCSS(base_url().'public/css/felis.lay.css');                              
        // For progressively larger displays                                                                        
        View::setCSS(base_url().'public/css/size/768.css', "text/css", "only all and (min-width: 768px)");     
        View::setCSS(base_url().'public/css/size/992.css', "text/css", "only all and (min-width: 992px)");
        
        View::setCSS(base_url().'public/css/felis/felis.form.css');      
        View::setCSS(base_url().'public/css/felis/felis.modal.css');               
        View::setCSS(base_url().'public/css/felis/felis.switches.css');     
        View::setCSS(base_url().'public/css/felis/felis.progress-slider.css');    
        
        /* Wczytanie domyślnych JS'ów */
        View::setJQ(base_url()."public/js/jquery/jquery-1.10.2.js");  
        View::setJQ(base_url()."public/js/jquery/jquery.cookie.js");  
        View::setJQ(base_url()."public/js/setup.js");     
        View::setJQ(base_url()."public/js/bootstrap/bootstrap.js");                   
        //Template functions
        View::setJQ(base_url()."public/js/felis/felis.input.js"); 
        View::setJQ(base_url()."public/js/felis/felis.message.js"); 
        View::setJQ(base_url()."public/js/felis/felis.modal.js"); 
        View::setJQ(base_url()."public/js/felis/felis.navigable.js"); 
        View::setJQ(base_url()."public/js/felis/felis.notify.js"); 
        View::setJQ(base_url()."public/js/felis/felis.scroll.js"); 
        View::setJQ(base_url()."public/js/felis/felis.progress-slider.js"); 
        View::setJQ(base_url()."public/js/felis/felis.tooltip.js"); 
        View::setJQ(base_url()."public/js/felis/felis.confirm.js");      
        View::setJQ(base_url()."public/js/felis/felis.tabs.js"); 
        //Tinycon 
        View::setJQ(base_url()."public/js/tinycon.js");  
    }
    
  }
