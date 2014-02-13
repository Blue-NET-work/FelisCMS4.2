<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    function __construct(){
        parent::__construct();  
        @FC_Request::loadModel('admin_model');                                                                        
    }
    
}