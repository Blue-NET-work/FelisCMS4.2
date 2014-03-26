<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
    }

	public function index(){
		$this->smarty->view("index.tpl");
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


/*
 *
 * Autoryzacja użytkownika
 * logowanie, wylogowanie itp.
 *
 */

// Logowanie
    public function sign_in(){
        $this->form_validation->set_error_delimiters("","<span style='padding-right:5px;'></span>");

        @FC_Request::loadLang("felis_login");

        if ($this->ion_auth->logged_in())
            $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond["logged"] = true));

        if(@FC_Request::post('item')){

            $this->form_validation->set_rules('item[login]', 'lang:felis_login_username', 'required');
            $this->form_validation->set_rules('item[password]', 'lang:felis_login_password', 'required');

            if ($this->form_validation->run() == true){
                $item = @FC_Request::post('item');

                if ($this->ion_auth->login($item['login'], $item['password'], isset($item['remember']))){
                    $respond["logged"] = true;
                    $respond["messages"] = $this->ion_auth->messages();
                    $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond));
                }
                else{
                    $respond["messages"] = $this->ion_auth->errors();
                    $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond));
                }
            }
            else{
                $respond["messages"] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
                $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond));
            }
        }
        else{

            if ($this->ion_auth->logged_in()){redirect('dashboard', 'refresh');}

            if($this->session->flashdata('message'))
                $messages = $this->session->flashdata('message');
            else
                $messages = $this->lang->line("felis_login_require_a_login");

            @View::setCSS(base_url());

            @View::setJQ(base_url());

            $query["messages"] = $messages;
            @FC_Request::smartyView("account/sign_in.tpl", $query);
        }

    }

// Wylogowanie
    public function logout(){
        $logout = $this->ion_auth->logout();
        $this->session->set_flashdata('message', $this->ion_auth->messages());
        redirect(base_url(), 'refresh');
    }

//Site error
    public function error_404(){
		show_404();
    }

}