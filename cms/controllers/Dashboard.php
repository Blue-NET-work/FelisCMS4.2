<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends FC_Controller {

	public function index(){
		@FC_Request::smartyView("index.tpl");
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
			}elseif($alias == "galeria"){
				$this->smarty->view("pages/galeria.tpl", $query);
			}else $this->smarty->view("pages/pages.tpl", $query);
        }
	}

//Site error
    public function error_404(){
		show_404();
    }

}