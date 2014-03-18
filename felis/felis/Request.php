<?php
class FC_Request {

    private $_css = array();
    private $_jq = array();


// Pobieranie wyników z get
    public function get($item = false) {
        if($item) $query = $this->input->get($item);
        else $query = $this->input->get();
        return $query;
    }

// Pobieranie wyników z post
    public function post($item = false) {
        if($item) $query = $this->input->post($item);
        else $query = $this->input->post();
        return $query;
    }

// Pobieranie obecnie używanego języka
    public function language(){
        $language = ($this->session->userdata('user_lang') != "") ? $this->session->userdata('user_lang') : $this->config->item('language');
        return $language;
    }

// Pobieranie IP ADRES odwiedzającego
    public function ipAddress() {
        $query = $this->input->ip_address();
        return $query;
    }

// Pobieranie danych $_server
    public function server($server = false) {
        if($server) $query = $this->input->server($server);
        else $query = $this->input->server();
        return $query;
    }

// Pobieranie danych user agent
    public function userAgent() {
        $query = $this->input->user_agent();
        return $query;
    }

// Pobieranie danych request headers
    public function requestHeaders() {
        $query = $this->input->request_headers();
        return $query;
    }

// Pobieranie danych get request headers
    public function getRequestHeaders() {
        $query = $this->input->get_request_headers();
        return $query;
    }

// IP ADRES veryfikacja
    public function validIp($ip) {
        $query = $this->input->valid_ip($ip);
        return $query;
    }

/*
 *
 * Wczytywania
 *
 */

// wczytanie jezyka
    public function loadLang($lang){
        if(is_array($lang)){
            foreach($lang as $item){
                $this->lang->load($item, FC_Request::language());
            }
        }
        else
            $this->lang->load($lang, FC_Request::language());
    }

// wczytanie modelu
    function loadModel($module){
        if(is_array($module)){
            foreach($module as $item){
                $this->load->model($item);
            }
        }
        else
            $this->load->model($module);

    }
// wczytanie biblioteki
    public function loadLibrary($library){
        $this->load->library($library);
    }
// wczytanie helper'a
    public function loadHelper($helper){
        $this->load->helper($helper);
    }

// wczytanie szablonu smarty + ew. przekazanie parametrów
    public function smartyView($template, $date = false){
        View::gets();
        if($date)$this->smarty->view($template, $date);
        else $this->smarty->view($template);
    }


//
//
//
//
//
//
//
// STARE
//
//
//
//
//
//
//


// ciasteczka
    public function cookie() {
        $query = $this->input->cookie();
        return $query;
    }
// ustawianie ciasteczka
    public function setCookie($item) {
        $query = $this->input->set_cookie($item);
        return $query;
    }
// getPOST
#    public function getPost($item = false) {
#        $query = $this->input->get_post($item);
#        return $query;
#    }

    #$this->input->is_ajax_request()
    #$this->input->is_cli_request()


}