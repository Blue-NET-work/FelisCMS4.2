<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class FC_Controller extends CI_Controller {
    
    public function __construct(){
        parent::__construct();  
        $this->__loginStatus();   
    }
    
    private function __loginStatus(){
        $siteStatus = FC_DB::getDataSelect('value', 'config', '`name` = "service_offline"');         
        if($siteStatus == 'TRUE'){
            if($this->ion_auth->is_admin() AND $this->ion_auth->is_admin()) $this->__offlineLogIn();
            else $this->__offline();
        }
    }
    
    private function __offline(){
        $startDate = FC_DB::getDataSelect('value', 'config', '`name` = "service_offline_startdate"');       
        $endDate = FC_DB::getDataSelect('value', 'config', '`name` = "service_offline_enddate"'); 
        $lang["site_offline_back"]    = lang("site_offline_back");
        $lang["site_offline_days"]    = lang("site_offline_days");
        $lang["site_offline_hours"]   = lang("site_offline_hours");
        $lang["site_offline_minutes"] = lang("site_offline_minutes");
        $lang["site_offline_seconds"] = lang("site_offline_seconds");
        $lang["site_offline_build"]   = lang("site_offline_build");
        $lang["site_offline_build"]   = lang("site_offline_build");
        
        require_once(BASEPATH.'views/clock.php');
        exit;
    }
    
    private function __offlineLogIn(){
        $system_url = system_url("/"); 
        $lang = lang("site_offline");   
        $messages = "<div style='position:fixed; width:58px; height:58px; top:0px; left:0px; z-index:99999;'><img style='width:58px; height:58px;' src='{$system_url}views/assets/img/clock/offline.png' alt='offline' title='{$lang}'></div>";
        print($messages);
    }       
}