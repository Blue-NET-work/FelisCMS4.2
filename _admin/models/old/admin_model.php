<?php
  class Admin_model extends CI_Model{
    
    public function __construct(){                
        parent::__construct();  
        $this->uri();
        $this->form_validation(); 
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
               
    
// Przekazywanie danych zalogowanego użytkownika
    function userLogIn(){
        if($this->ion_auth->logged_in()){     
            $_avatar = templates_url("assets/img/user.png"); 
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
        View::setCSS(templates_url('assets/css/bootstrap/bootstrap.css')); 
        View::setCSS(templates_url('assets/css/bootstrap/bootstrap-theme.css'));  
        View::setCSS(templates_url('assets/css/styles.css'));            
        View::setCSS(templates_url('assets/css/colors.css'));                     
        View::setCSS(templates_url('assets/css/print.css'), "text/css", "print");   
        View::setCSS(templates_url('assets/css/felis.lay.css'));                              
        // For progressively larger displays                                                                        
        View::setCSS(templates_url('assets/css/size/768.css'), "text/css", "only all and (min-width: 768px)");     
        View::setCSS(templates_url('assets/css/size/992.css'), "text/css", "only all and (min-width: 992px)");
        
        View::setCSS(templates_url('assets/css/felis/felis.form.css'));      
        View::setCSS(templates_url('assets/css/felis/felis.modal.css'));               
        View::setCSS(templates_url('assets/css/felis/felis.switches.css'));     
        View::setCSS(templates_url('assets/css/felis/felis.progress-slider.css'));    
        
        /* Wczytanie domyślnych JS'ów */
        View::setJQ(templates_url("assets/js/jquery/jquery-1.11.0.js"));  
        View::setJQ(templates_url("assets/js/jquery/jquery.cookie.js"));  
        View::setJQ(templates_url("assets/js/setup.js"));     
        View::setJQ(templates_url("assets/js/bootstrap/bootstrap.js"));                   
        //Template functions
        View::setJQ(templates_url("assets/js/felis/felis.input.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.message.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.modal.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.navigable.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.notify.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.scroll.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.progress-slider.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.tooltip.js")); 
        View::setJQ(templates_url("assets/js/felis/felis.confirm.js"));      
        View::setJQ(templates_url("assets/js/felis/felis.tabs.js")); 
        //Tinycon 
        View::setJQ(templates_url("assets/js/tinycon.js"));                 
    }
    
  }
