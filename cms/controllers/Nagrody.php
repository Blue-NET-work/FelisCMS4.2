<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nagrody extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
    }

	public function index(){
		$query["nagrody"] = $this->db->join('nagrody_photo', 'np_parent_id = id', "left")->join('nagrody_price', 'npe_nid = id', "left")->group_by('id')->get("nagrody")->result_array();
		$this->smarty->view("nagrody/index.tpl", $query);
	}

// Nagroda
	public function nagroda($id){

        if($this->session->flashdata('message')){
            $msg = $this->session->flashdata('message');
            if(isset($msg['text']))$messages = $msg;
            else $messages = array('boxClass' => "alert-danger", 'text'=>"{$msg}");
        	$this->smarty->assigns("messages", $messages);
        }

		$query = $this->db->get_where("nagrody", array("id"=>$id))->row_array();
		$nagroda_photo = $this->db->get_where("nagrody_photo", array("np_parent_id"=>$id))->result_array();
		$nagroda_price = $this->db->get_where("nagrody_price", array("npe_nid"=>$id))->result_array();

        $this->smarty->assigns("nagroda_price", $nagroda_price);
        $this->smarty->assigns("nagroda_photo", $nagroda_photo);

		$this->smarty->view("nagrody/nagroda.tpl", $query);
	}


}