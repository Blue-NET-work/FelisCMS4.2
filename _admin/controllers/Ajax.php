<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ajax extends FC_Controller {

// Funkcja przetwarzania w locie Tytułu na alias
	public function url_title(){
		$post_title = $this->input->post("post_title");
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode(url_title(convert_accented_characters($post_title), '-', TRUE)));
	}

}