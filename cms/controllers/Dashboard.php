<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends FC_Controller {

	public function index(){
        $query = $this->db->get_where("pages", array('id' => 1, 'active'=> "1"))->row_array();
        $this->smarty->view("index.tpl", $query);
	}

 // Podstrony
	public function pages($alias){
        if($alias == "index" || $alias == "home" || $alias == "strona-glowna") redirect(base_url(), 'refresh');

        $query = $this->db->get_where("pages", array('alias' => $alias, 'active'=> "1"))->row_array();

        if(!$query)
            $this->error_404();
        else{
			if($alias == "kontakt"){
				$this->smarty->view("pages/pages_kontakt.tpl", $query);
			}else $this->smarty->view("pages/pages.tpl", $query);
        }
	}

//Site error
    public function error_404(){
		show_404();
    }

}