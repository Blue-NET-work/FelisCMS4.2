<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hotele extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
    }

	public function index(){
		$query["hotele"] = $this->db->join('hotels_photo', 'hp_parent_id = id')->group_by('id')->get("hotels")->result_array();
		$this->smarty->view("hotele/index.tpl", $query);
	}

// Miasto
	public function miasto($miasto){
		$city_id = $this->db->get_where("city", array("alias" => $miasto))->row("id");
		$query["hotele"] = $this->db->join('hotels_photo', 'hp_parent_id = id')->group_by('id')->get_where("hotels", array("city" => $city_id))->result_array();
		$this->smarty->view("hotele/index.tpl", $query);
	}

// Hotel
	public function hotel($id){
		$query = $this->db->get_where("hotels", array("id"=>$id))->row_array();
		$hotels_photo = $this->db->get_where("hotels_photo", array("hp_parent_id"=>$id))->result_array();

		$query["tags"] = explode(",",$query["tags"]);

		$pakiety = $this->db->join('pakiet_photo', 'pp_parent_id = p_id')->group_by('p_id')->get_where("pakiet", array("p_hotels"=>$id))->result_array();
        $this->smarty->assigns("pakiety", $pakiety);
        $this->smarty->assigns("hotels_photo", $hotels_photo);

		$this->smarty->view("hotele/hotel.tpl", $query);
	}

// Hotel ocen
	public function ocena($id, $voit){
		$item = array("hv_hid"=>$id, "hv_voit"=>$voit);
    	@FC_DB::insert('pages', $item);
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
	}

}