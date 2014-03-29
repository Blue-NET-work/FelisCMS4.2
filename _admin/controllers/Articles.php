<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Articles extends FC_Controller {

    function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array('Admin_model', 'Articles_model'));
        @FC_Request::loadLang(array('felis_pages'));
	}

    public function index(){
        $query["articles"] = $this->Articles_model->pagesList();
        @FC_Request::smartyView('articles/list.tpl', $query);
    }

// Dodawanie podstrony
    public function add(){
        $query["message"] = false;
        $query["page"] = array("a_active" => 1);
        if(@FC_Request::post('item')){
            $item = @FC_Request::post("item");

            $this->form_validation->set_rules('item[a_name]', 'lang:default_name', 'required');
            $this->form_validation->set_rules('item[a_alias]', 'lang:default_adres', 'required');

            if ($this->form_validation->run() == true){
            	$item = @FC_Request::post('item');
            	$item["a_date"] = date("Y-m-d H:i:s");

                $query["insert"] = @FC_DB::insert('articles', $item);

                if($query["insert"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_add_success'), "icon"=>"button-check.png");
                else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_add_error'), "icon"=>"stop.png");

            }else $query["messages"] = array('head' => lang('default_error'), "info"=> "{validation_errors()}", "icon"=>"stop.png");
        }

        $query["articles"] = $this->Articles_model->pagesTree();
        @FC_Request::smartyView("articles/add.tpl", $query);
    }

    public function edit($id){

        if($id != false){
            if($this->db->get_where("articles", array("a_id"=>$id))->row_array()){

                if(@FC_Request::post("item")){
                    $item = @FC_Request::post("item");
                    if(!isset($item["a_active"])){$item["a_active"] = "0";}

                    $item["a_alias"]= url_title(convert_accented_characters(element('a_alias', $item)), '-', TRUE);

                    $this->form_validation->set_rules('item[a_name]', 'lang:default_name', 'required');
                    $this->form_validation->set_rules('item[a_alias]', 'lang:default_adres', 'required');

                    if ($this->form_validation->run() == true){
                        $query["update"] = @FC_DB::update('articles', $item, array("a_id"=>$id));

                        if($query["update"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_edit_success'), "icon"=>"button-check.png");
                        else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_edit_error'), "icon"=>"stop.png");

                    }else $query["messages"] = array('head' => lang('default_error'), "info"=> validation_errors(), "icon"=>"stop.png");
                }

        		$query["articles"] = $this->Articles_model->pagesTree();
                $query["page"] = @FC_DB::getData('articles', array("a_id"=>$id));

            }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_failure'), "icon"=>"stop.png");
        }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang("pages_failure_id"), "icon"=>"stop.png");

        @FC_Request::smartyView('articles/edit.tpl', $query);
    }

// Usuwanie podstrony
    public function del(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $where = array('id'=>$date["id"]);
        $query = $this->db->delete('pages', $where);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

// Aktywacja podstrony
    public function active(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $data = array('active' => '1');
        $where = "`id` = {$date["id"]}";
        $query = $this->db->update_string('pages', $data, $where);
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
        $query = $this->db->update_string('pages', $data, $where);
        $query = $this->db->query($query);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

}