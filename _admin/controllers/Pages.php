<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends FC_Controller {

    function __construct(){
        parent::__construct();  
        @FC_Request::loadModel('admin_model'); 
        @FC_Request::loadLang('felis_pages');                                                                       
    }
    
    public function index(){ 
        
        @FC_Request::smartyView('pages/list.tpl');
    }
    
}