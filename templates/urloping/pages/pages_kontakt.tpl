{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading">{$name}</div>
              <div class="panel-body">
	              <div class="row">
                  	<div class="col-md-6">
	              		{$description}
                  	</div>
                  	<div class="col-md-6">
                  	<img src="{$TEMPLATES}assets/img/form.png" class="padding-bottom-20" alt="">
                    	<form id="contact_form" class="Kontakt" method="post" action="?s=Kontakt">

						  <div class="form-group">
						    <label for="name">Imię i nazwisko:</label>
						    <input type="text" name="name" class="form-control">
						  </div>
						  <div class="form-group">
						    <label for="company">Nazwa firmy:</label>
						    <input type="text" name="company" class="form-control">
						  </div>
						  <div class="form-group">
						    <label for="from">Adres e-mail:</label>
						    <input type="text" name="from" class="form-control">
						  </div>
						  <div class="form-group">
						    <label for="tel">Telefon:</label>
						    <input type="text" name="tel" class="form-control">
						  </div>
						  <div class="form-group">
						    <label for="subject">Temat wiadomości:</label>
						    <input type="text" name="subject" class="form-control">
						  </div>
						  <div class="form-group">
						    <label for="text">Treśc wiadomości:</label>
						    <textarea name="text" class="form-control"></textarea>
						  </div>
						  <div class="form-group">
						    <label for="contact">Preferowana forma kontaktu:</label>
							<select name="contact" class="form-control">
								<option value="0" selected="selected">wybierz</option>
								<option value="1">kontakt przez e-mail</option>
								<option value="2">kontakt telefoniczny</option>
							</select>
						  </div>
                          <input type="submit" name="contact_send" class="btn btn-default" value="wyślij...">

						</form>
                  	</div>
	              </div>
              </div>
            </div>

{/block}