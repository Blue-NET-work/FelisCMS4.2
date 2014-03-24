<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends FC_Controller {

	public function index(){

		@FC_Request::smartyView("index.tpl");
	}

}