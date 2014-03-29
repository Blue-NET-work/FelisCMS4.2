<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pakiety extends FC_Controller {

    function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array('Admin_model', 'Pakiety_model'));
        @FC_Request::loadLang(array('felis_pages'));
	}

    public function index(){
        $query["pages"] = $this->Pakiety_model->pagesList();
        @FC_Request::smartyView('pakiety/list.tpl', $query);
    }

// Dodawanie podstrony
    public function add(){
        $query["message"] = false;
        $query["page"]["p_active"] = 1;

        if(@FC_Request::post('item')){
            $item = @FC_Request::post("item");

            $this->form_validation->set_rules('item[p_name]', 'lang:default_name', 'required');
            $this->form_validation->set_rules('item[p_alias]', 'lang:default_adres', 'required');

            if ($this->form_validation->run() == true){
                $item["p_alias"]= url_title(convert_accented_characters(element('p_alias', $item)), '-', TRUE);
                $query["insert"] = @FC_DB::insert('pakiet', @FC_Request::post('item'));

                if($query["insert"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_add_success'), "icon"=>"button-check.png");
                else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_add_error'), "icon"=>"stop.png");

            }else $query["messages"] = array('head' => lang('default_error'), "info"=> "{validation_errors()}", "icon"=>"stop.png");
        }

        @FC_Request::smartyView("pakiety/add.tpl", $query);
    }

    public function edit($id){

        if($id != false){
            if($this->db->get_where("pakiet", array("p_id"=>$id))->row_array()){

                if(@FC_Request::post("item")){
                    $item = @FC_Request::post("item");
                    if(!isset($item["p_active"])){$item["p_active"] = "0";}
                    if(!isset($item["p_occasional"])){$item["p_occasional"] = "0";}
                    if(!isset($item["p_week"])){$item["p_week"] = "0";}

                    $item["p_alias"]= url_title(convert_accented_characters(element('p_alias', $item)), '-', TRUE);

                    $this->form_validation->set_rules('item[p_name]', 'lang:default_name', 'required');
                    $this->form_validation->set_rules('item[p_alias]', 'lang:default_adres', 'required');

                    if ($this->form_validation->run() == true){
                        $query["update"] = @FC_DB::update('pakiet', $item, array("p_id"=>$id));

                        if($query["update"] == 1) $query["messages"] = array('head' => lang('default_success'), "info"=>lang('pages_edit_success'), "icon"=>"button-check.png");
                        else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_edit_error'), "icon"=>"stop.png");

                    }else $query["messages"] = array('head' => lang('default_error'), "info"=> validation_errors(), "icon"=>"stop.png");
                }

                $query["page"] = @FC_DB::getData('pakiet', array("p_id"=>$id));
                $query["photos"] = $this->db->order_by("pp_sort", "asc")->get_where('pakiet_photo', array("pp_parent_id"=>$id))->result_array();

            }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang('pages_failure'), "icon"=>"stop.png");
        }else $query["messages"] = array('head' => lang('default_error'), "info"=>lang("pages_failure_id"), "icon"=>"stop.png");

        @FC_Request::smartyView('pakiety/edit.tpl', $query);
    }

// Usuwanie podstrony
    public function del(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $where = array('p_id'=>$date["id"]);
        $query = $this->db->delete('pakiet', $where);
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
    }

// Aktywacja podstrony
    public function active(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $data = array('p_active' => '1');
        $where = "`p_id` = {$date["id"]}";
        $query = $this->db->update_string('pakiet', $data, $where);
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
        $data = array('p_active' => '0');
        $where = "`p_id` = {$date["id"]}";
        $query = $this->db->update_string('pakiet', $data, $where);
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
            $data = array('pp_sort' => $_POST['position'][$key-1]);
            $where = "pp_id = {$mActionedId}";
            $query = FC_DB::update('pakiet_photo', $data, $where);
            $data = array('pp_sort' => $_POST['position'][$key]);
            $where = "pp_id = {$_POST['photoId'][$key-1]}";
            $query = FC_DB::update('pakiet_photo', $data, $where);
            }
        // down
        if ($mAction == "movedown")
            {
            $key = array_search($mActionedId,$_POST['photoId']);
            $data = array('pp_sort' => $_POST['position'][$key]);
            $where = "pp_id = {$_POST['photoId'][$key+1]}";
            $query = FC_DB::update('pakiet_photo', $data, $where);
            $data = array('pp_sort' => $_POST['position'][$key+1]);
            $where = "pp_id = {$mActionedId}";
            $query = FC_DB::update('pakiet_photo', $data, $where);
            }
        // po kolei
        if ($mAction == "moveall")
            {
            $categories = $_POST['photoId'];
            $poristions = $_POST['position'];
            for ($i = 0; $i < count($categories); $i++){
                $data = array('pp_sort' => $_POST['position'][$i]);
                $where = "pp_id = {$_POST['photoId'][$i]}";
                $query = FC_DB::update('pakiet_photo', $data, $where);
                }
            }
        header('Location: '.site_url('pakiety/edit/'.$id));
    }
// Usuwanie zdjęcia
    public function photoDel($id, $news){
        $where = array('pp_id' => $id, 'pp_parent_id'=> $news);
        $sql = $this->db->delete('pakiet_photo', $where);
        header('Location: '.site_url('pakiety/edit/'.$news));
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
            $this->Pakiety_model->uploadFotoAction($id, $options);
        }
        header('Location: '.site_url('pakiety/edit/'.$id));
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
                $this->Pakiety_model->serverFotoAction($id, $options);
            }
        }
        header('Location: '.site_url('pakiety/edit/'.$id));
    }

}