<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Panel extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
        // Jeśli niezalogowany to przenosi na logowanie
        if(!$this->ion_auth->logged_in())
        	redirect(base_url("zaloguj.html"), 'refresh');
    }

	public function index(){
		$query["hotele"] = $this->db->count_all('hotels');

		$this->smarty->view("account/index.tpl", $query);
	}

	public function dane(){
        $messages = array('boxClass' => "alert-danger", "text" => "Test");

		$query = $this->ion_auth->user()->row();

        $this->smarty->assigns("messages", $messages);
		$this->smarty->view("account/you.tpl", $query);
	}



}