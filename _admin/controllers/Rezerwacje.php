<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rezerwacje extends FC_Controller {

    function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array('Admin_model', 'Rezerwacje_model'));
        @FC_Request::loadLang(array('felis_pages'));
	}

    public function index(){
    	$query = false;
        $query["pages"] = $this->Rezerwacje_model->pagesList();
        @FC_Request::smartyView('rezerwacje/list.tpl', $query);
    }


//Blokowanie podstrony
    public function accept(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $data = array('r_status' => '2');
        $where = "`r_id` = {$date["id"]}";
        $query = $this->db->update_string('reservation', $data, $where);
        $query = $this->db->query($query);
        $reservation = $this->db->get_where("reservation", $where)->row_array();
        $pakiet = $this->db->get_where("pakiet", array("p_id"=>$reservation["r_pid"]))->row_array();
        $user = $this->db->get_where("users", array("id"=>$reservation["r_uid"]))->row_array();
        $point = $user["point"] + $pakiet["p_points"];
        $query1 = $this->db->update_string('users', array("point"=>$point), array("id"=>$reservation["r_uid"]));
        $query1 = $this->db->query($query1);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }


//Blokowanie podstrony
    public function unaccept(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $data = array('r_status' => '3');
        $where = "`r_id` = {$date["id"]}";
        $query = $this->db->update_string('reservation', $data, $where);
        $query = $this->db->query($query);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

}