<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hotele extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
    }

	public function index(){
		$query["hotele"] = $this->db->get("hotels")->result_array();
		$this->smarty->view("hotele/index.tpl", $query);
	}

// Miasto
	public function miasto($miasto){
		$query["hotele"] = $this->db->get_where("hotels", array("city" => $miasto))->result_array();
		$this->smarty->view("hotele/index.tpl", $query);
	}

// Hotel
	public function hotel($id){
		$query = $this->db->get_where("hotels", array("id"=>$id))->row_array();
		$this->smarty->view("hotele/hotel.tpl", $query);
	}

}