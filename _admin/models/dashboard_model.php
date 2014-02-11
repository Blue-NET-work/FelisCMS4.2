<?php
class Dashboard_model extends CI_Model{
    
    public function __construct(){                
        parent::__construct(); 
        $this->agendaToday(); 
        $this->new_users(); 
        //Statystyka
        $this->statisticNewUsers();
        $this->statisticReturnUsers(); 
        $this->statisticNewItems();
        $this->statisticNewComments();
        //Uprawnienia plików
        $this->permissionsFolder();  
    }  

// Przekazanie do agendy dnia tygodnia    
    function agendaToday(){   
        $this->smarty->assign("agendaToday", date('w'));
    }
    
// Wyświetlenie nowych użytkowników    
    function new_users($users_limit = 6){                                             
        $users = FC_DB::tableOrderLimit('users', '`created_on` DESC', $users_limit, 'id, first_name, last_name'); 
        foreach($users as $key=>$user){     
             $user_permissions = FC_DB::getWhere('users_permissions', array('up_user_id'=>$user["id"]), "*", '`up_group_id` DESC');
             foreach($user_permissions as $up=>$user_permission){
                 $user_group = FC_DB::getData('users_groups', array('ug_id'=>$user_permission["up_group_id"]));
                 $users[$key]["group"][$up] = array('user_group' => $user_group["ug_name"], 'user_color'=> $user_group["ug_color"]);                 
             }  
        }                  
        
        $this->smarty->assigns("dashboard_users", $users);    
    }
        
//Statystyka nowych użytkowników
    function statisticNewUsers(){      
        $time = strtotime("-1 month");
        $newUsers = FC_DB::getWhereCount('users', "created_on >= {$time}");
        $this->smarty->assigns("dashboard_statisticNewUsers", $newUsers);  
    }
        
//Statystyka powracający użytkownicy
    function statisticReturnUsers(){
        $time = strtotime("-1 month");
        $returnUsers = FC_DB::getWhereCount('users', "last_login >= {$time}");
        $this->smarty->assigns("dashboard_statisticReturnUsers", $returnUsers);  
    }
        
//Statystyka nowych wpisów
    function statisticNewItems(){
        $time = date("Y-m-d H:i:s", strtotime("-1 month"));
        $newItems = FC_DB::getWhereCount('articles', "a_date >= '{$time}'");
        $this->smarty->assigns("dashboard_statisticNewItems", $newItems);
    }
        
//Statystyka nowe komentarze
    function statisticNewComments(){         
        $time = date("Y-m-d H:i:s", strtotime("-1 month"));
        $newComments = FC_DB::getWhereCount('articles_comments', "acs_date >= '{$time}'");
        $this->smarty->assigns("dashboard_statisticNewComments", $newComments);
    }
    
// Prawa zapisu dla folderów
    function permissionsFolder(){
        $permissions = false;                     
        $this->config->load('felis/felis_chmod'); 
        $pms = $this->config->item("chmodFelis"); 
        foreach($pms as $item){
            $ppp = substr(sprintf('%o', fileperms(ROOTPATH.'tmp')), -3);
            if($ppp != $item["chmod"]){
                $permissions[] = $item;
            }    
        }                                                 
        $this->smarty->assigns("permissions", $permissions);
    }        
    
}