{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}
        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-sign-in"></i> Rejestracja</div>
              <div class="panel-body text-center">

{include file="assets/helpview/messages.tpl" messages=$messages}

	              <div class="row margin-top-20">
                  	<div class="col-md-3"></div>
                  	<div class="col-md-6">
	                    <form class="form-horizontal" id="logowanie" action="{$base_url}rejestracja.html" role="form" method="POST">
	                        <!-- pole -->
	                      <div class="form-group">
	                        <label for="inputEmail3" class="col-sm-5 control-label">Login</label>
	                        <div class="col-sm-7">
	                          <input type="text" name="item[username]" class="form-control" id="inputEmail3" placeholder="Nazwa użytkownika">
	                        </div>
	                      </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputEmail" class="col-sm-5 control-label">Adres e-mail</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputEmail" name="item[email]" placeholder="Adres e-mail" value="{$email.value}">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
	                      <div class="form-group">
	                        <label for="inputPassword3" class="col-sm-5 control-label">Hasło</label>
	                        <div class="col-sm-7">
	                          <input type="password" name="item[password]" class="form-control" id="inputPassword3" placeholder="Hasło">
	                        </div>
	                      </div>
	                        <!-- pole -->
	                        <!-- pole -->
	                      <div class="form-group">
	                        <label for="inputPassword3" class="col-sm-5 control-label">Potwierdź Hasło</label>
	                        <div class="col-sm-7">
	                          <input type="password" name="item[password_confirm]" class="form-control" id="inputPassword3" placeholder="Potwierdź Hasło">
	                        </div>
	                      </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputFirst" class="col-sm-5 control-label">Imię</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputFirst" name="item[first_name]" placeholder="Imię" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputLast" class="col-sm-5 control-label">Nazwisko</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputLast" name="item[last_name]" placeholder="Nazwisko" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputAddress" class="col-sm-5 control-label">Adres</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputAddress" name="item[address]" placeholder="Adres" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputAddress1" class="col-sm-5 control-label">Adres (opcjonalnie)</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputAddress1" name="item[address_1]" placeholder="Adres" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputPostCode" class="col-sm-5 control-label">Kod pocztowy</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputPostCode" name="item[post_code]" placeholder="Kod pocztowy" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputCity" class="col-sm-5 control-label">Miejscowość</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputCity" name="item[city]" placeholder="Miejscowość" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputCountry" class="col-sm-5 control-label">Państwo</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputCountry" name="item[country]" placeholder="Państwo" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                        <!-- pole -->
						  <div class="form-group">
							<label for="inputPhone" class="col-sm-5 control-label">Telefon</label>
							<div class="col-sm-7">
							  <input type="text" class="form-control" id="inputPhone" name="item[phone]" placeholder="Telefon" value="">
							</div>
						  </div>
	                        <!-- pole -->
	                      <div class="form-group">
	                        <div class="col-sm-offset-3 col-sm-9">
	                          <button type="submit" class="btn btn-default"><i class="fa fa-sign-in"></i> zarejestruj</button>
	                        </div>
	                      </div>
	                    </form>
                  	</div>
                  	<div class="col-md-3"></div>
	              </div>
              </div>
            </div>

{/block}