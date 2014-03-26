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

// Oferta tygodnia
	public function oferta_tygodnia(){
		$this->smarty->view("tygodnia.tpl");
	}

// Okolicznościowe
	public function okolicznosciowe(){
		$this->smarty->view("okolicznosciowe.tpl");
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

        if($this->session->flashdata('message')){
            $msg = $this->session->flashdata('message');
            if(isset($msg['text']))$messages = $msg;
            else $messages = array('boxClass' => "alert-danger", 'text'=>"{$msg}");
        }
        else $messages = array('boxClass' => "alert-info", 'text'=>$this->lang->line("login_require_a_login"));

        if ($this->ion_auth->logged_in())
            $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($respond["logged"] = true));

        if(@FC_Request::post('item')){

            $this->form_validation->set_rules('item[login]', 'lang:felis_login_username', 'required');
            $this->form_validation->set_rules('item[password]', 'lang:felis_login_password', 'required');

            if ($this->form_validation->run() == true){
                $item = @FC_Request::post('item');

                if ($this->ion_auth->login($item['login'], $item['password'], isset($item['remember']))){
                    $this->session->set_flashdata('message', $this->ion_auth->messages());
                }
                else{
                    $this->session->set_flashdata('message', $this->ion_auth->errors());
                }
            }
            else{
                $system_messages = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
                $messages = array('boxClass' => "alert-danger", 'text'=>"{$system_messages}", 'action'=>"shake");
            }
        }


        if ($this->ion_auth->logged_in()){redirect(base_url("panel.html"), 'refresh');}


        $query["messages"] = $messages;
        $this->smarty->view("account/sign_in.tpl", $query);
    }

// Wylogowanie
    public function logout(){
        $logout = $this->ion_auth->logout();
        $this->session->set_flashdata('message', $this->ion_auth->messages());
        redirect(base_url(), 'refresh');
    }

// Rejestracja
	public function register(){

        if($this->session->flashdata('message')){
            $msg = $this->session->flashdata('message');
            if(isset($msg['text']))$messages = $msg;
            else $messages = array('boxClass' => "alert-danger", 'text'=>"{$msg}");
        }
        else $messages = array('boxClass' => "alert-info", 'text'=>$this->lang->line("login_require_a_login"));


		$tables = $this->config->item('tables','ion_auth');

		//validate form input
		$this->form_validation->set_rules('item[first_name]', $this->lang->line('create_user_validation_fname_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[last_name]', $this->lang->line('create_user_validation_lname_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[email]', $this->lang->line('create_user_validation_email_label'), 'required|valid_email|is_unique['.$tables['users'].'.email]');
		$this->form_validation->set_rules('item[phone]', $this->lang->line('create_user_validation_phone_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[company]', $this->lang->line('create_user_validation_company_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[password]', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('item[password_confirm]', $this->lang->line('create_user_validation_password_confirm_label'), 'required');

		if ($this->form_validation->run() == true)
		{
			if(!$this->input->post('item[username]')){
				$username = strtolower($this->input->post('item[first_name]')) . ' ' . strtolower($this->input->post('item[last_name]'));
			}
			else{
				$username = strtolower($this->input->post('item[username]'));
			}

			$email    = strtolower($this->input->post('item[email]'));
			$password = $this->input->post('item[password]');

			$additional_data = array(
				'first_name' => $this->input->post('item[first_name]'),
				'last_name'  => $this->input->post('item[last_name]'),
				'company'    => $this->input->post('item[company]'),
				'phone'      => $this->input->post('item[phone]'),
			);
		}
		if ($this->form_validation->run() == true && $this->ion_auth->register($username, $password, $email, $additional_data))
		{
			$this->session->set_flashdata('message', $this->ion_auth->messages());
			redirect(base_url("rejestracja"), 'refresh');
		}
		else
		{
			//display the create user form
			//set the flash data error message if there is one
            $system_messages = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
            $messages = array('boxClass' => "alert-danger", 'text'=>"{$system_messages}", 'action'=>"shake");

			$this->data['first_name'] = array(
				'name'  => 'first_name',
				'id'    => 'first_name',
				'type'  => 'text',
				'value' => $this->form_validation->set_value('first_name'),
			);
			$this->data['last_name'] = array(
				'name'  => 'last_name',
				'id'    => 'last_name',
				'type'  => 'text',
				'value' => $this->form_validation->set_value('last_name'),
			);
			$this->data['email'] = array(
				'name'  => 'email',
				'id'    => 'email',
				'type'  => 'text',
				'value' => $this->form_validation->set_value('email'),
			);
			$this->data['company'] = array(
				'name'  => 'company',
				'id'    => 'company',
				'type'  => 'text',
				'value' => $this->form_validation->set_value('company'),
			);
			$this->data['phone'] = array(
				'name'  => 'phone',
				'id'    => 'phone',
				'type'  => 'text',
				'value' => $this->form_validation->set_value('phone'),
			);
			$this->data['password'] = array(
				'name'  => 'password',
				'id'    => 'password',
				'type'  => 'password',
				'value' => $this->form_validation->set_value('password'),
			);
			$this->data['password_confirm'] = array(
				'name'  => 'password_confirm',
				'id'    => 'password_confirm',
				'type'  => 'password',
				'value' => $this->form_validation->set_value('password_confirm'),
			);


		}

		$query["messages"] = $messages;

        $this->smarty->view("account/register.tpl", $query);
	}

/*
 *
 *
 *
 *
 *
 *
 */

//Site error
    public function error_404(){
		show_404();
    }

}