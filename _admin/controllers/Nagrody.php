<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nagrody extends FC_Controller {

    function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array('Admin_model', 'Nagrody_model'));
        @FC_Request::loadLang(array('felis_pages'));
	}

    public function index(){
        $query["pages"] = $this->Nagrody_model->pagesList();
        @FC_Request::smartyView('nagrody/list.tpl', $query);
    }

// Dodawanie podstrony
    public function add(){
        $query["message"] = false;
            $query["page"]["active"] = 1;

        if(@FC_Request::post('item')){
            $item = @FC_Request::post("item");

            $this->form_validation->set_rules('item[name]', 'lang:default_name', 'required');
            $this->form_validation->set_rules('item[alias]', 'lang:default_adres', 'required');

            if ($this->form_validation->run() == true){
                $query["insert"] = @FC_DB::insert('nagrody', @FC_Request::post('item'));

                if($query["insert"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_add_success'), "icon"=>"button-check.png");
                else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_add_error'), "icon"=>"stop.png");

            }else $query["messages"] = array('head' => lang('default_error'), "info"=> "{validation_errors()}", "icon"=>"stop.png");
        }

        @FC_Request::smartyView("nagrody/add.tpl", $query);
    }

    public function edit($id){

        if($id != false){
            if($this->db->get_where("nagrody", array("id"=>$id))->row_array()){

                if(@FC_Request::post("item")){
                    $item = @FC_Request::post("item");
                    if(!isset($item["active"])){$item["active"] = "0";}

                    $item["alias"]= url_title(convert_accented_characters(element('alias', $item)), '-', TRUE);

                    $this->form_validation->set_rules('item[name]', 'lang:default_name', 'required');
                    $this->form_validation->set_rules('item[alias]', 'lang:default_adres', 'required');

                    if ($this->form_validation->run() == true){
                        $query["update"] = @FC_DB::update('nagrody', $item, array("id"=>$id));

                        if($query["update"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_edit_success'), "icon"=>"button-check.png");
                        else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_edit_error'), "icon"=>"stop.png");

                    }else $query["messages"] = array('head' => lang('default_error'), "info"=> validation_errors(), "icon"=>"stop.png");
                }

                $query["page"] = @FC_DB::getData('nagrody', array("id"=>$id));
                $query["prices"] = $this->db->get_where('nagrody_price', array("npe_nid"=>$id))->result_array();
                $query["photos"] = $this->db->order_by("np_sort", "asc")->get_where('nagrody_photo', array("np_parent_id"=>$id))->result_array();
            }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_failure'), "icon"=>"stop.png");
        }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang("pages_failure_id"), "icon"=>"stop.png");

        @FC_Request::smartyView('nagrody/edit.tpl', $query);
    }

// Usuwanie podstrony
    public function del(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $where = array('id'=>$date["id"]);
        $query = $this->db->delete('nagrody', $where);
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
        $query = $this->db->update_string('nagrody', $data, $where);
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
        $query = $this->db->update_string('nagrody', $data, $where);
        $query = $this->db->query($query);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

// Sortowanie galerii
    public function sorts($id){
        $mActionedId = $id;
        foreach ($_POST as $key => $value)
            if (substr($key,0,6) == "submit")
                {
                $last_underscore = strrpos($key,"_");
                $mAction = substr($key,strlen("submit_"),$last_underscore-strlen("submit_"));
                $mActionedId = (int)substr($key,$last_underscore+1);
                break;
                }

        if ($mAction == "moveup")
            {
            $key = array_search($mActionedId,$_POST['photoId']);
            $data = array('np_sort' => $_POST['position'][$key-1]);
            $where = "np_id = {$mActionedId}";
            $query = FC_DB::update('nagrody_photo', $data, $where);
            $data = array('np_sort' => $_POST['position'][$key]);
            $where = "np_id = {$_POST['photoId'][$key-1]}";
            $query = FC_DB::update('nagrody_photo', $data, $where);
            }
        // down
        if ($mAction == "movedown")
            {
            $key = array_search($mActionedId,$_POST['photoId']);
            $data = array('np_sort' => $_POST['position'][$key]);
            $where = "np_id = {$_POST['photoId'][$key+1]}";
            $query = FC_DB::update('nagrody_photo', $data, $where);
            $data = array('np_sort' => $_POST['position'][$key+1]);
            $where = "np_id = {$mActionedId}";
            $query = FC_DB::update('nagrody_photo', $data, $where);
            }
        // po kolei
        if ($mAction == "moveall")
            {
            $categories = $_POST['photoId'];
            $poristions = $_POST['position'];
            for ($i = 0; $i < count($categories); $i++){
                $data = array('np_sort' => $_POST['position'][$i]);
                $where = "np_id = {$_POST['photoId'][$i]}";
                $query = FC_DB::update('nagrody_photo', $data, $where);
                }
            }
        header('Location: '.site_url('nagrody/edit/'.$id));
    }
// Usuwanie zdjęcia
    public function photoDel($id, $news){
        $where = array('np_id' => $id, 'np_parent_id'=> $news);
        $sql = $this->db->delete('nagrody_photo', $where);
        header('Location: '.site_url('nagrody/edit/'.$news));
    }
// Dodawanie zdjęcia
    public function uploadFoto($id) {
        $id = $_POST['id'];
        if ($id > 0) {
            $options = array(
                'file' => $_FILES['foto']['tmp_name'],
                'alt' => $_POST['alt'],
                'title' => $_POST["title"],
                'filename' => $_FILES['foto']['name']
            );
            $this->Nagrody_model->uploadFotoAction($id, $options);
        }
        header('Location: '.site_url('nagrody/edit/'.$id));
    }
//Dodawanie zdjęć
    public function serverFoto($id) {
        $id = intval($_POST['id']);
        $files = $_POST["files"];
        $alt = $_POST["alt"];
        $title = $_POST["title"];
        if ($id > 0) {
            for($i=0;$i<count($files); $i++){
                $options = array(
                    'file' => $files[$i],
                    'alt'  => $alt[$i],
                    'title'=> $title[$i]
                );
                $this->Nagrody_model->serverFotoAction($id, $options);
            }
        }
        header('Location: '.site_url('nagrody/edit/'.$id));
    }

// Dodawanie atrybutu cenowego
	public function atrybutAdd($id){
        if($this->input->post("item")){
        	$item = $this->input->post("item");
        	$item["npe_nid"] = $id;
        	@FC_DB::insert("nagrody_price", $item);
        }
        header('Location: '.site_url('nagrody/edit/'.$id));
	}
// Usuwanie atrybutu cenowego
	public function atrybutDel($id, $nagroda){
        $where = array('npe_id' => $id, 'np_parent_id'=> $nagroda);
        $sql = $this->db->delete('nagrody_price', $where);
        header('Location: '.site_url('nagrody/edit/'.$nagroda));
	}


}