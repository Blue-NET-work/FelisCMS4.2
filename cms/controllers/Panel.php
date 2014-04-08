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
        $messages = false;

		$user = $this->ion_auth->user()->row();

		//validate form input
		$this->form_validation->set_rules('item[first_name]', $this->lang->line('edit_user_validation_fname_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[last_name]', $this->lang->line('edit_user_validation_lname_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[address]', $this->lang->line('edit_user_validation_address_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[post_code]', $this->lang->line('edit_user_validation_post_code_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[city]', $this->lang->line('edit_user_validation_city_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[country]', $this->lang->line('edit_user_validation_country_label'), 'required|xss_clean');
		$this->form_validation->set_rules('item[phone]', $this->lang->line('edit_user_validation_phone_label'), 'required|xss_clean');

		if (isset($_POST) && !empty($_POST))
		{

			$messages = array('boxClass' => "alert-danger");

			$item = $this->input->post("item");

			$data = array(
				'first_name' => $item['first_name'],
				'last_name'  => $item['last_name'],
				'address'  	 => $item['address'],
				'address_1'  => $item['address_1'],
				'post_code'  => $item['post_code'],
				'city'  	 => $item['city'],
				'country'  	 => $item['country'],
				'phone'      => $item['phone'],
			);


			//update the password if it was posted
			if ($this->input->post('item[password]'))
			{
				$this->form_validation->set_rules('item[password]', $this->lang->line('edit_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
				$this->form_validation->set_rules('item[password_confirm]', $this->lang->line('edit_user_validation_password_confirm_label'), 'required');

				$data['password'] = $this->input->post('item[password]');
			}

			if ($this->form_validation->run() === TRUE)
			{
				$this->ion_auth->update($user->id, $data);

				//check to see if we are creating the user
				//redirect them back to the admin page
				$this->session->set_flashdata('message', "Dane zapisane");
				$messages = array('boxClass' => "alert-success");

			}
		}


		//set the flash data error message if there is one
		$messages["text"] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

        $this->smarty->assigns("messages", $messages);
		$this->smarty->view("account/you.tpl", $user);
	}



 /*
  *
  *	Rezerwacje
  *
  */

// Rezerwacje
	public function rezerwacje(){
		$query["rezerwacje"] = false;

		$user = $this->ion_auth->user()->row();
		$rezerwacje = $this->db->get_where("reservation", array("r_uid"=>$user->id))->result_array();

		foreach($rezerwacje as $rezerwacja){
			$pakiet = array();
            $pakiet = $this->db->join('pakiet_photo', 'pp_parent_id = p_id')->group_by('p_id')->get_where("pakiet", array("p_id"=>$rezerwacja["r_pid"]))->row_array() + $rezerwacja;
            $query["rezerwacje"][] = $pakiet;
		}

		$this->smarty->view("account/rezerwacje.tpl", $query);
	}

// Rezerwacja
	public function rezerwacja($id, $methods = "payu"){
		$user = $this->ion_auth->user()->row();
		$query["rezerwacja"] = $this->db->get_where("reservation", array("r_id"=>$id, "r_uid"=>$user->id))->row_array();
        $query["pakiet"] = $this->db->get_where("pakiet", array("p_id"=>$query["rezerwacja"]["r_pid"]))->row_array();
		$query["pakiet_photo"] = $this->db->get_where("pakiet_photo", array("pp_parent_id"=>$query["rezerwacja"]["r_pid"]))->result_array();
        $query["hotel"] = $this->db->get_where("hotels", array("id"=>$query["rezerwacja"]["r_hid"]))->row_array();
        date_default_timezone_set('europe/warsaw');
        $data = "%Y-%m-%d %H:%i:%s";
        $now = mdate($data, time());

        if($query["rezerwacja"]["r_status"] == 0){
	        if($methods == "przelewy24"){
        		$price = $query["pakiet"]["p_price"] * 0.10;

	            $przelewy24 = @FC_DB::getData('payment_metods', array("name"=>'przelewy24'));
	            $price = $price * 100;
	            $sygnatura = "urloping/{$user->id}/{$query["rezerwacja"]["r_pid"]}/{$id}"."-".time();

	            $method[] = array('name' => "p24_session_id", 'value' => $sygnatura);
	            $method[] = array('name' => 'p24_id_sprzedawcy', 'value' => $przelewy24["param_1"]);
	            $method[] = array('name' => 'p24_kwota', 'value' => $price);
	            $method[] = array('name' => "p24_crc", 'value' => md5("{$sygnatura}|{$przelewy24["param_1"]}|{$price}|{$przelewy24["param_2"]}"));
	            $method[] = array('name' => "p24_opis", 'value' => "Zamowienie w serwisie Blue-NET: "."urloping/{$user->id}/{$query["rezerwacja"]["r_pid"]}/{$id}");
	            $method[] = array('name' => "p24_kraj", 'value' => "PL");
	            $method[] = array('name' => "p24_language", 'value' => "pl");
	            $method[] = array('name' => "p24_return_url_ok", 'value' => base_url()."panel/weryfikuj_przelewy24.html");
	            $method[] = array('name' => "p24_return_url_error", 'value' => base_url()."panel/weryfikuj_przelewy24.html");

	            $method[] = array('name' => "p24_klient", 'value' => $user->first_name.' '.$user->last_name);
	            $method[] = array('name' => "p24_adres", 'value' => $user->address);
	            $method[] = array('name' => "p24_miasto", 'value' => $user->city);
	            $method[] = array('name' => "p24_kod", 'value' => $user->post_code);
	            $method[] = array('name' => "p24_email", 'value' => $user->email);

	            $query["payments"] = $method;

	            // Datownik (teraz, termin płatności)
	            date_default_timezone_set('europe/warsaw');
	            $data = "%Y-%m-%d %H:%i:%s";
	            $now = mdate($data);

	            $przelew = @FC_DB::getDataSelect('p24_session_id', 'przelewy24', array('p24_session_id'=>$sygnatura), 'p24_session_id');
	            if(!$przelew){
	                $_p24 = array('p24_uid'=>$user->id, 'p24_pid'=>$id, 'p24_session_id'=>$sygnatura, 'p24_kwota'=>$price, 'p24_data'=>$now);
	                @FC_DB::insert('przelewy24', $_p24);
	            }

	            //$urlForm = "https://secure.przelewy24.pl/index.php";
	            $query["urlForm"] = "https://sandbox.przelewy24.pl/index.php";
			}
	        // płatności payu
	        elseif($methods == "payu"){
        		$price = $query["pakiet"]["p_price"] * 0.10;

	            $payu = @FC_DB::getData('payment_metods', array("name"=>'payu'));
	            $price = $price * 100;
	            $sygnatura = "urloping/{$user->id}/{$query["rezerwacja"]["r_pid"]}/{$id}"."-".time();
	            $client_ip = @FC_Request::ipAddress();
	            $desc = "Zamówienie w serwisie Blue-NET: ".$sygnatura;
	            $ts = time();
	            $sig = '';

	            $method[] = array('name' => "pos_id", 'value' => $payu["param_1"]);
	            $method[] = array('name' => "session_id", 'value' => $sygnatura);
	            $method[] = array('name' => 'pos_auth_key', 'value' => $payu["param_4"]);
	            $method[] = array('name' => 'amount', 'value' => $price);
	            $method[] = array('name' => "desc", 'value' => $desc);
	            $method[] = array('name' => "trsDesc", 'value' => $desc);
	            $method[] = array('name' => "order_id", 'value' => "urloping/{$user->id}/{$query["rezerwacja"]["r_pid"]}/{$id}");
	            $method[] = array('name' => "first_name", 'value' => $user->first_name);
	            $method[] = array('name' => "last_name", 'value' => $user->last_name);

	            $method[] = array('name' => "payback_login", 'value' => '0013710532');
	            $method[] = array('name' => "street", 'value' => $user->address);
	            $method[] = array('name' => "city", 'value' => $user->city);
	            $method[] = array('name' => "post_code", 'value' => $user->post_code);
	            $method[] = array('name' => "email", 'value' => $user->email);
	            $method[] = array('name' => "client_ip", 'value' => $client_ip);
	            $method[] = array('name' => "ts", 'value' => $ts);

	            foreach($method as $array){$sig .= $array["value"];}
	            $sig .= $payu["param_2"];
	            $method[] = array('name' => "sig", 'value' => md5($sig));
	            $query["payments"] = $method;

	            $przelew = @FC_DB::getDataSelect('payu_session_id', 'payu', array('payu_session_id'=>$sygnatura), 'payu_session_id');
	            if(!$przelew){
	                $_payu = array('payu_uid'=>$user->id, 'payu_pid'=>$id, 'payu_session_id'=>$sygnatura, 'payu_order_id'=>"urloping/{$user->id}/{$query["rezerwacja"]["r_pid"]}/{$id}", 'payu_amount'=>$price, 'payu_data'=>$now);
	                @FC_DB::insert('payu', $_payu);
	            }

	            $query["urlForm"] = "https://www.platnosci.pl/paygw/UTF/NewPayment";
	        }
		}

		$this->smarty->view("account/rezerwacja.tpl", $query);
	}

// Rezerwacj
	public function rezerwuj($id){
		$messages = false;
		$user = $this->ion_auth->user()->row();

		if($this->input->post("r_date")){
			$data = array("r_date" => $this->input->post("r_date"), "r_uid" => $user->id, "r_pid" => $id, "r_status" => 0, "r_hid" => $this->db->get_where("pakiet", array("p_id"=>$id))->row("p_hotels"));

	        $sql = $this->db->insert_string("reservation", $data);
	        $status = $this->db->query($sql);
            $pakiet_id = $this->db->insert_id();
	        if($status == 1){
	        	$this->email->from('automat@urloping.com', 'Automat Urloping')->to($user->email)->bcc("info@urloping.com");
				$this->email->subject('Rezerwacja pobytu w serwisie urloping.com');
				$this->email->message("<h4>Witaj, {$user->first_name}</h4><p>Dziękujemy za dokonanie rezerwacji w naszym serwisie, Twoje zamówienie możesz podejrzeć pod adresem <a href='".base_url("panel/rezerwacja/{$pakiet_id}.html")."'>".base_url("panel/rezerwacja/{$pakiet_id}.html")."</a>. Pamiętaj, że zamówienie jest rezerwowane dopiero po wpłacie zaliczki.");
				$this->email->send();

				$messages = array('boxClass' => "alert-success", "text" => "Rezerwacja dokonana!");
        		redirect(base_url("panel/rezerwacja/{$pakiet_id}.html"), 'refresh');
	        }
	        else{
				$messages = array('boxClass' => "alert-danger", "text" => "Rezerwacja nie została dokonana!");
	        }

		}

		$query["messages"] = $messages;
		$this->smarty->view("account/rezerwuj.tpl", $query);
	}

// Sprawdzenie daty
	public function rezerwuj_data(){
        $response = array('status' => 'ok', 'message' => array());
        $date = $this->input->post("date");
        if($date){}else $response['status']="error";
        $response["message"]['action'] = $query;
        $response["message"]['post'] = $date;
		return $this->output->set_content_type('application/json', 'utf-8')->set_output(json_encode($response));
	}

// Faktury Płatności - Weryfikuj płatność
    public function weryfikuj_przelewy24(){
		$user = $this->ion_auth->user()->row();
        $user_id = $user->id;
        $bn = false;
        //Przelewy24 dane
        $przelewy24 = @FC_DB::getData('payment_metods', array("name"=>'przelewy24'));

        // Weryfikacja przelewu
        $p24Post = @FC_Request::post();
        if(isset($p24Post)){
            date_default_timezone_set('europe/warsaw');
            $p24_ver["p24_order_id_full"]    = $p24Post["p24_order_id_full"];
            if(isset($p24Post["p24_error_code"])) $p24_ver["p24_error_code"]       = $p24Post["p24_error_code"];
            $p24_ver["p24_order_id"]         = $p24Post["p24_order_id"];
            $p24_ver["p24_karta"]            = $p24Post["p24_karta"];
            $p24_ver["p24_kwota"]            = $p24Post["p24_kwota"];

            $sygnatura = explode("-", $p24Post["p24_session_id"]);
            $sygnatura = explode("/",$sygnatura[0]);

            //$p24_ver["p24_uid"]
            $p24 = @FC_DB::update('przelewy24', $p24_ver, array('p24_session_id' => $p24Post["p24_session_id"]));
            @FC_Request::loadModel("payments/przelewy24");
            $felisp24 = Przelewy24::weryfikuj($przelewy24['param_1'], $p24Post["p24_session_id"], $p24_ver["p24_order_id"], $przelewy24['param_2'], $p24_ver["p24_kwota"]);
            $przelew24 = @FC_DB::getData('przelewy24', array('p24_session_id' => $p24Post["p24_session_id"]));
    		$felisp24 = TRUE;
            $bn["payments"] = $felisp24;

            if($felisp24 == TRUE){
        		$p24Pay = @FC_DB::getData('przelewy24', array('p24_session_id' => $p24Post["p24_session_id"]));
                @FC_DB::update('reservation', array('r_status'=>1, 'r_payment'=> $p24Pay["id"]), array('r_id'=>$sygnatura[3]));
            }
            else @FC_DB::update('przelewy24', array('p24_error_code' =>  $p24Post["p24_error_code"]), array('p24_order_id' => $p24_ver["p24_order_id"]));
        }

        $this->smarty->view('account/weryfikacja.tpl', $bn);
    }


//Faktury Płatności - Weryfikuj PayU
    public function payu_success(){
		$user = $this->ion_auth->user()->row();
        $user_id = $user->id;
        $bn = false;
        $get = @FC_Request::get();
        if(isset($get)){
            $payu = @FC_DB::getData('payment_metods', array("name"=>'payu'));
            if($payu["param_1"] == $get["pos_id"]){
            $bn["payments"] = true;
                $update = @FC_DB::update('payu', array('payu_trans_id'=>$get["transId"], 'payu_pay_type'=>$get["pay_type"]), array('payu_session_id'=> $get["session_id"], 'payu_order_id'=> $get["order_id"]));

	            $sygnatura = explode("-", $get["session_id"]);
	            $sygnatura = explode("/",$sygnatura[0]);

                 if($update == TRUE){
                    $payu_records = @FC_DB::getData('payu', array('payu_session_id'=> $get["session_id"], 'payu_order_id'=> $get["order_id"]));
                		@FC_DB::update('reservation', array('r_status'=>1, 'r_payment'=> $payu_records["payu_pid"]), array('r_id'=>$sygnatura[3]));
                }
                else $bn["realizacja"] = TRUE;
            }
        }
        $this->smarty->view('account/weryfikacja.tpl', $bn);
    }

    public function payu_error(){
        $get = @FC_Request::get();
        if($get){
            $error_messages = array(
                "100" => "Brak lub błedna wartosc parametru pos id",
                "101" => "Brak parametru session id",
                "102" => "Brak parametru ts",
                "103" => "Brak lub błędna wartość parametru sig",
                "104" => "Brak parametru desc",
                "105" => "Brak parametru client ip",
                "106" => "Brak parametru first name",
                "107" => "Brak parametru last name",
                "108" => "Brak parametru street",
                "109" => "Brak parametru city",
                "110" => "Brak parametru post code",
                "111" => "Brak parametru amount",
                "112" => "Błedny numer konta bankowego",
                "113" => "Brak parametru email",
                "114" => "Brak numeru telefonu",
                "200" => "Inny chwilowy błąd",
                "201" => "Inny chwilowy błąd bazy danych",
                "202" => "Pos o podanym identyfikatorze jest zablokowany",
                "203" => "Niedozwolona wartosc pay type dla danego pos id",
                "204" => "Podana metoda płatnosci (wartosc pay type) jest chwilowo zablokowana dla danego pos id, np. przerwa konserwacyjna bramki płatniczej",
                "205" => "Kwota transakcji mniejsza od wartosci minimalnej",
                "206" => "Kwota transakcji wieksza od wartosci maksymalnej",
                "207" => "Przekroczona wartość wszystkich transakcji dla jednego klienta w ostatnim przedziale czasowym",
                "208" => "Pos działa w wariancie ExpressPayment lecz nie nastapiła aktywacja tego wariantu współpracy (czekamy na zgode działu obsługi klienta)",
                "209" => "Błędny numer pos id lub pos auth key",
                "500" => "Transakcja nie istnieje",
                "501" => "Brak autoryzacji dla danej transakcji",
                "502" => "Transakcja rozpoczeta wczesniej",
                "503" => "Autoryzacja do transakcji była juz przeprowadzana",
                "504" => "Transakcja anulowana wczesniej",
                "505" => "Transakcja przekazana do odbioru wczesniej",
                "506" => "Transakcja juz odebrana",
                "507" => "Bład podczas zwrotu srodków do klienta",
                "599" => "Błedny stan transakcji, np. nie mozna uznac transakcji kilka razy lub inny, prosimy o kontakt",
                "999" => "Inny bład krytyczny - prosimy o kontakt"
            );
            $bn["error"] = $error_messages[$get["error"]];
            $update = @FC_DB::update('payu', array('payu_error'=>$get["error"], 'payu_trans_id'=>$get["transId"], 'payu_pay_type'=>$get["pay_type"]), array('payu_session_id'=> $get["session_id"], 'payu_order_id'=> $get["order_id"]));
        }
        $bn["payments"] = false;
        $this->smarty->view('account/weryfikacja.tpl', $bn);
    }


 /*
  *
  *	Koszykowe
  *
  */

// Koszyk
    public function koszyk(){
        $basket_items = $this->cart->format_number($this->cart->total_items());

        if(!empty($basket_items)){
            $this->smarty->assign("basket_total", $this->cart->format_number($this->cart->total()));
            $this->smarty->assign("basket_item", $this->cart->contents());
        }

        $this->smarty->assign("basket_items", $basket_items);
        $this->smarty->view('account/basket.tpl');
    }

// Krok 1
	public function krok1(){
        $basket = $this->cart->contents();

        if($basket){
        	foreach ($basket as $product) {
                $product_id = explode("_",$product["id"]);
                //$order_date["pp_pid"] = $order_id;
                $order_date["pp_name"] = $product["name"];
                $order_date["pp_netto"] = $product["price"] / 1.23;
                $order_date["pp_value_netto"] = $product["subtotal"] / 1.23;
                $order_date["pp_price_vat"] = $order_date["pp_netto"] * 0.23;
                $order_date["pp_jm"] = "szt";
                $order_date["pp_vat"] = "23";
                $order_date["pp_value_vat"] = $order_date["pp_value_netto"] * 0.23;
                $order_date["pp_qty"] = $product["qty"];
                $order_date["pp_brutto"] = $product["price"];
                $order_date["pp_value_brutto"] = $product["subtotal"];
                //$order_date["pp_period"] = $product_id[2];
                $order_date["pp_basket_id"] = $product["id"];
                //$order_data = array('pp_basket_id'=>$product["id"], 'pp_period'=>$order_date["pp_period"], 'pp_pid'=>$order_id, 'pp_name'=>$product["name"], 'pp_netto'=>$order_date["pp_netto"], 'pp_value_netto'=>$order_date["pp_value_netto"], 'pp_price_vat'=>$order_date["pp_price_vat"], 'pp_jm'=>$order_date["pp_jm"], 'pp_vat'=>$order_date["pp_vat"], 'pp_value_vat'=>$order_date["pp_value_vat"], 'pp_qty'=>$order_date["pp_qty"], 'pp_brutto'=>$order_date["pp_brutto"], 'pp_value_brutto'=>$order_date["pp_value_brutto"]);
                //$order_product = FC_DB::insert('payment_position', $order_data);
                //$order_date["pp_id"] = $this->db->insert_id();
            }

            //print_r($order_data);

        }

        $this->smarty->view('account/krok1.tpl');
	}



// Koszyk dodawanie
    public function dodaj(){
        $response = array('status' => 'ok','message' => array());
        $date = @FC_Request::post("date");
        if($date){}else $response['status']="error";
        $content = $this->cart->contents();
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
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk usuwanie wpisu
    public function remove($rowid) {
        $data = array('rowid' => $rowid,'qty' => 0);
        $action = @FC_BASKET::update($data);
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk zwiększenie sztuk
    public function qty_add($rowid, $qty) {
        $data = array('rowid' => $rowid, 'qty' => ++$qty);
        $action = FC_BASKET::update($data);
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk zmniejszenie sztuk
    public function qty_remove($rowid, $qty) {
        $data = array('rowid' => $rowid, 'qty' => --$qty);
        $action = @FC_BASKET::update($data);
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Koszyk czyszczenie
    public function wyczysc(){
        $action = $this->cart->destroy();
        $referer = @FC_Request::server("HTTP_REFERER");
        header('Location: '.$referer);
    }

// Sprawdzanie czy produkt jest w koszyku
    function isInCart($array, $key, $value){foreach($array as $k => $v){if($v[$key] == $value){return TRUE;}}}

// Pobieranie rowid produktu z koszyka
    function isInCartDate($array, $key, $value, $re){foreach($array as $k => $v){if($v[$key] == $value){return $v[$re];}}}




}