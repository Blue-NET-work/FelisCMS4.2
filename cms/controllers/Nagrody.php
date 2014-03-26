<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nagrody extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
    }

	public function index(){
		$query["nagrody"] = $this->db->get("nagrody")->result_array();
		$this->smarty->view("nagrody/index.tpl", $query);
	}

// Nagroda
	public function nagroda($id){
		$this->smarty->view("nagrody/nagroda.tpl");
	}


}