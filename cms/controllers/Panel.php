<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Panel extends FC_Controller {

    public function __construct(){
        parent::__construct();
        @FC_Request::loadModel(array("Default_model"));
        // Jeśli niezalogowany to przenosi na logowanie
        if(!$this->ion_auth->logged_in())
        	redirect(base_url("zaloguj.html"), 'refresh');
    }

	public function index(){
		$query["hotele"] = $this->db->count_all('hotels');
		$query["pakiety"] = $this->db->count_all('pakiet');

		$user = $this->ion_auth->user()->row();
		$query["userPoint"] = $user->point;

		$this->smarty->view("account/index.tpl", $query);
	}

	public function dane(){
        $messages = array('boxClass' => "alert-danger", "text" => "Test");

		$query = $this->ion_auth->user()->row();

        $this->smarty->assigns("messages", $messages);
		$this->smarty->view("account/you.tpl", $query);
	}

 /*
  *
  *
  *
  *
  */

// Koszyk
    public function koszyk(){
        $basket_items = @FC_BASKET::total_items();

        if(!empty($basket_items)){
            $basket_total = @FC_BASKET::total();
            $basket_item = @FC_BASKET::contents();
            $this->smarty->assign("basket_total", $basket_total);
            $this->smarty->assign("basket_item", $basket_item);
        }

        $this->smarty->assign("basket_items", $basket_items);
        $this->smarty->view('account/basket.tpl');
    }

// Koszyk dodawanie
    public function dodaj(){
        $response = array('status' => 'ok','message' => array());
        $date = @FC_Request::post("date");
        if($date){}else $response['status']="error";
        $content = @FC_BASKET::contents();
        $basket = $this->isInCart($content, "id", $date["id"]);
        if($basket == 1){
            $rowid = $this->isInCartDate($content, "id", $date["id"], "rowid");
            $qty = $this->isInCartDate($content, "id", $date["id"], "qty");
            $data = array('rowid' => $rowid,'qty' => ++$qty);
            $action = @FC_BASKET::update($data);
        }
        else{
            $action = @FC_BASKET::insert($date);
        }
        $response["message"]['id'] = $action;
        $response["message"]['post'] = $date;
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk usuwanie wpisu
    public function remove() {
        $response = array('status' => 'ok', 'message' => array());
        $date = @FC_Request::post("date");
        if($date){}else $response['status']="error";
        $data = array('rowid' => $date["id"],'qty' => 0);
        $action = @FC_BASKET::update($data);
        $response["message"]['id'] = $action;
        $response["message"]['post'] = $date;
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk zwiększenie sztuk
    public function qty_add() {
        $response = array('status' => 'ok', 'message' => array());
        $date = @FC_Request::post("date");
        if($date){}else $response['status']="error";
        $data = array('rowid' => $date["id"], 'qty' => ++$date["qty"]);
        $action = @FC_BASKET::update($data);
        $response["message"]['id'] = $action;
        $response["message"]['post'] = $date;
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk zmniejszenie sztuk
    public function qty_remove() {
        $response = array('status' => 'ok', 'message' => array());
        $date = @FC_Request::post("date");
        if($date){}else $response['status']="error";
        $data = array('rowid' => $date["id"], 'qty' => --$date["qty"]);
        $action = @FC_BASKET::update($data);
        $response["message"]['id'] = $action;
        $response["message"]['post'] = $date;
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk czyszczenie
    public function wyczysc(){
        $referer = @FC_Request::server("HTTP_REFERER");
        $action = @FC_BASKET::destroy();
        print $action;
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Sprawdzanie czy produkt jest w koszyku
    function isInCart($array, $key, $value){foreach($array as $k => $v){if($v[$key] == $value){return TRUE;}}}

// Pobieranie rowid produktu z koszyka
    function isInCartDate($array, $key, $value, $re){foreach($array as $k => $v){if($v[$key] == $value){return $v[$re];}}}



}