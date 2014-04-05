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