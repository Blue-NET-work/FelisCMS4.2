<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends CI_Controller {

    function __construct(){
        parent::__construct();
        //Wczytanie domyślnego stylu
        @FC_Request::loadModel(array('Admin_model', 'Rezerwacje_model'));
        @FC_Request::loadLang(array('felis_pages', 'felis_users'));
    }

    public function index(){
        $query["users"] = $this->ion_auth->users()->result();
        foreach ($query["users"] as $k => $user){
            $query["users"][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
        }
        @FC_Request::smartyView("users/list.tpl", $query);
    }

    public function edit($id){

        if($id != false){
            if($this->ion_auth->user($id)){

                if(@FC_Request::post("item")){
                    $item = @FC_Request::post("item");
                    if(!isset($item["active"])){$item["active"] = "0";}

                    $this->form_validation->set_rules('item[name]', 'lang:default_name', 'required');
                    $this->form_validation->set_rules('item[alias]', 'lang:default_adres', 'required');

                    if ($this->form_validation->run() == true){
                        $query["update"] = @FC_DB::update('users', $item, array("id"=>$id));

                        if($query["update"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_edit_success'), "icon"=>"accept.png");
                        else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_edit_error'), "icon"=>"warning.png");

                    }else $query["messages"] = array('head' => lang('default_error'), "info"=> validation_errors(), "icon"=>"warning.png");
                }

        		$query["user"] = $this->ion_auth->user($id)->row();

            }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_failure'), "icon"=>"warning.png");
        }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang("pages_failure_id"), "icon"=>"warning.png");

        @FC_Request::smartyView("users/edit.tpl", $query);
    }

    public function you(){
        $query["message"] = "message";
        if(@FC_Request::post('item')){
            //print_r(@FC_Request::post('item'));
        }
        $query["user"] = $this->ion_auth->user()->row();
        @FC_Request::smartyView("users/you.tpl", $query);
    }

// Aktywacja podstrony
    public function active(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $data = array('active' => '1');
        $where = "`id` = {$date["id"]}";
        $query = $this->db->update_string('users', $data, $where);
        $query = $this->db->query($query);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

//Blokowanie podstrony
    public function block(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $data = array('active' => '0');
        $where = "`id` = {$date["id"]}";
        $query = $this->db->update_string('users', $data, $where);
        $query = $this->db->query($query);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

}