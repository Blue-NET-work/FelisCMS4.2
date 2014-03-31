<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
        @FC_Request::loadLibrary("Facebook_ion_auth");
	}


	public function index(){
		$query["miasta"] = $this->db->get("city")->result_array();
		$query["pakiety"] = $this->db->limit(4)->join('pakiet_photo', 'pp_parent_id = p_id')->group_by('p_id')->get("pakiet")->result_array();
		$query["nagrody"] = $this->db->join('nagrody_photo', 'np_parent_id = id', "left")->join('nagrody_price', 'npe_nid = id', "left")->group_by('id')->get_where("nagrody", array("active" => 1))->result_array();
		$query["aktualnosci"] = $this->db->order_by('a_date', 'DESC')->limit(3)->get("articles")->result_array();

		$query["mapa"][2] = $this->db->select("city.name, city.alias")->order_by('city.name', 'ASC')->join('city', 'city.id = hotels.id')->group_by('city.id')->get_where("hotels", array("region"=>2))->result_array();
		$query["mapa"][3] = $this->db->select("city.name, city.alias")->order_by('city.name', 'ASC')->join('city', 'city.id = hotels.id')->group_by('city.id')->get_where("hotels", array("region"=>3))->result_array();
		$query["mapa"][4] = $this->db->select("city.name, city.alias")->order_by('city.name', 'ASC')->join('city', 'city.id = hotels.id')->group_by('city.id')->get_where("hotels", array("region"=>4))->result_array();
		$query["mapa"][5] = $this->db->select("city.name, city.alias")->order_by('city.name', 'ASC')->join('city', 'city.id = hotels.id')->group_by('city.id')->get_where("hotels", array("region"=>5))->result_array();
		$query["mapa"][6] = $this->db->select("city.name, city.alias")->order_by('city.name', 'ASC')->join('city', 'city.id = hotels.id')->group_by('city.id')->get_where("hotels", array("region"=>6))->result_array();

		$obiekty = $this->db->order_by('hp_sort', 'DESC')->join('hotels_photo', 'hp_parent_id = id', "left")->group_by('id')->get_where("hotels", array('recommended' => 1, "hp_sort"=>1))->result_array();

        $active = true;
		$query["obiekty"] = array();
        $i = 0;
		foreach($obiekty as $obiekt){
            $obiekt["price"] = $this->db->order_by('p_price', 'ASC')->get_where("pakiet", array("p_hotels"=>$obiekt["id"]))->row("p_price");

        	$obiekt["active"] = $active;
        	$obiekt["item"] = $i++;
        	$active = false;
        	$obiekt["pakiety"] = $this->db->like('p_hotels', $obiekt["id"])->from("pakiet")->count_all_results();

        	$query["obiekty"][] = $obiekt;
		}

		if (isset($_GET['code'])){

	     $this->facebook_ion_auth->login();
	     if (!$this->ion_auth->logged_in())
	     {
	           header('Location:/zaloguj.html?alert=facebooklogin');
	           exit();
	     }

	     header('Location:/');
	 }

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

// Oferta tygodnia
	public function oferta_tygodnia(){
		$query["pakiet"] = $this->db->get_where("pakiet", array("p_week"=>"1"))->row_array();
		$query["hotel"] = $this->db->get_where("hotels", array("id"=>$query["pakiet"]["p_hotels"]))->row_array();
		$query["pakiet_photo"] = $this->db->get_where("pakiet_photo", array("pp_parent_id"=>$query["pakiet"]["p_id"]))->result_array();

		$this->smarty->view("tygodnia.tpl", $query);
	}

// Okolicznościowe
	public function okolicznosciowe(){
		$query["pakiety"] = $this->db->join('pakiet_photo', 'pp_parent_id = p_id', 'right')->group_by('p_id')->get_where("pakiet", array("p_occasional"=>"1"))->result_array();

		$this->smarty->view("okolicznosciowe.tpl", $query);
	}

// Okolicznościowe
	public function pakiet($id){
		$query["pakiet"] = $this->db->get_where("pakiet", array("p_id"=>$id))->row_array();
		$query["hotel"] = $this->db->get_where("hotels", array("id"=>$query["pakiet"]["p_hotels"]))->row_array();
		$query["pakiet_photo"] = $this->db->get_where("pakiet_photo", array("pp_parent_id"=>$id))->result_array();

		$this->smarty->view("pakiet.tpl", $query);
	}

// Szukaj
	public function szukaj(){
		$region = $this->input->post("region");
		$term = $this->input->post("time");
		$p_occasional = $this->input->post("p_occasional");
		redirect(base_url("oferta/{$region}/{$term}/{$p_occasional}"), 'refresh');
	}

// Obiekty
	public function oferta($region, $term, $p_occasional = 0){
		$hotele = $this->db->join('hotels_photo', 'hp_parent_id = id')->get_where("hotels", array("region" => $region))->result_array();

		$pakiety = array();
		foreach($hotele as $hotel){
			$where = array("p_hotels" => $hotel["id"], "p_occasional" => $p_occasional);
			if(!$term == 0){
				$where["p_term"] = $term;
			}

        	$pakieciki = $this->db->get_where("pakiet", $where)->result_array();
            foreach($pakieciki as $pakiet){
            	$pakiety[] = $pakiet;
            }
		}


		$query["pakiety"] = $pakiety;
        $query["region"] = $region;
        $query["term"] = $term;
        $query["p_occasional"] = $p_occasional;
		$this->smarty->view("oferta.tpl", $query);
	}

// Artykuł
	public function article($alias, $id){

		$where = array("a_alias" => $alias, "a_id"=> $id);
		$query = $this->db->get_where("articles", $where)->row_array();

		$this->smarty->view("article.tpl", $query);
	}


// Newsletter add
	public function newsletter(){
		$query["messages"] = false;

		$this->smarty->view("newsletter.tpl", $query);
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

//Facebook login
    function loginfacebook(){
      $this->facebook_ion_auth->login();
	}


	//activate the user
	function activate($id, $code=false)
	{
		if ($code !== false)
		{
			$activation = $this->ion_auth->activate($id, $code);
		}
		else if ($this->ion_auth->is_admin())
		{
			$activation = $this->ion_auth->activate($id);
		}

		if ($activation)
		{
			//redirect them to the auth page
			$this->session->set_flashdata('message', $this->ion_auth->messages());
			redirect("/", 'refresh');
		}
		else
		{
			//redirect them to the forgot password page
			$this->session->set_flashdata('message', $this->ion_auth->errors());
			redirect("auth/forgot_password", 'refresh');
		}
	}

// Rejestracja
	public function register(){
		$messages = false;

        if($this->session->flashdata('message')){
            $msg = $this->session->flashdata('message');
            if(isset($msg['text']))$messages = $msg;
            else $messages = array('boxClass' => "alert-info", 'text'=>"{$msg}");
        }

		$tables = $this->config->item('tables','ion_auth');

		//validate form input
		$this->form_validation->set_rules('item[first_name]', $this->lang->line('create_user_validation_fname_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[last_name]', $this->lang->line('create_user_validation_lname_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[email]', $this->lang->line('create_user_validation_email_label'), 'required|valid_email|is_unique['.$tables['users'].'.email]');
		$this->form_validation->set_rules('item[password]', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[item[password_confirm]]');
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