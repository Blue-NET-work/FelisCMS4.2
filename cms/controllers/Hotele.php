<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hotele extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
    }

	public function index(){
		$this->smarty->view("hotele/index.tpl");
	}

// Miasto
	public function miasto($miasto){
		print_r($miasto);
		$this->smarty->view("hotele/index.tpl");
	}

// Podstrony
	public function pages($alias){
        if($alias == "index" || $alias == "home" || $alias == "strona-glowna") redirect(base_url(), 'refresh');

        $query = $this->db->get_where("pages", array('alias' => $alias, 'active'=> "1"))->row_array();

        if(!$query)
            $this->error_404();
        else
        	$this->smarty->view("pages/pages.tpl", $query);

	}



}