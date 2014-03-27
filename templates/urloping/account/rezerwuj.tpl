{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
	<link href="{$TEMPLATES}assets/css/bootstrap/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css">
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
                <div class="col-md-12 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="polecaneObiekty">
                      <div class="panel-heading"><i class="fa fa-pencil"></i> Rezerwacja</div>
                      <div class="panel-body padding-10">

{include file="assets/helpview/messages.tpl" messages=$messages}

                      	<div class="row margin-top-20">
                        	<div class="col-md-3"></div>
                        	<div class="col-md-6">
	                            <form class="form-horizontal" role="form" method="POST">
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputFirst" class="col-sm-4 control-label">Imię</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputFirst" name="item[first_name]" placeholder="Imię" value="{$first_name}">
								    </div>
								  </div>
	                            	<!-- pole -->
	                            	<!-- pole -->
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
								  <div class="form-group">
								    <label for="inputAddress1" class="col-sm-4 control-label">Adres (opcjonalnie)</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputAddress1" name="item[address_1]" placeholder="Adres" value="{$address_1}">
								    </div>
								  </div>
	                            	<!-- pole -->
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputPostCode" class="col-sm-4 control-label">Kod pocztowy</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputPostCode" name="item[post_code]" placeholder="Kod pocztowy" value="{$post_code}">
								    </div>
								  </div>
	                            	<!-- pole -->
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputCity" class="col-sm-4 control-label">Miejscowość</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputCity" name="item[city]" placeholder="Miejscowość" value="{$city}">
								    </div>
								  </div>
	                            	<!-- pole -->
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputCountry" class="col-sm-4 control-label">Państwo</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputCountry" name="item[country]" placeholder="Państwo" value="{$country}">
								    </div>
								  </div>
	                            	<!-- pole -->
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputPhone" class="col-sm-4 control-label">Telefon</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputPhone" name="item[phone]" placeholder="Telefon" value="{$phone}">
								    </div>
								  </div>
	                            	<!-- pole -->
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputEmail" class="col-sm-4 control-label">Adres e-mail</label>
								    <div class="col-sm-8">
								      <input type="text" class="form-control" id="inputEmail" name="item[email]" placeholder="Telefon" value="{$email}">
								    </div>
								  </div>
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
								    <div class="col-sm-8">
								      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
								    </div>
								  </div>

								  <div class="form-group">
								    <div class="col-sm-offset-4 col-sm-8">
								      <button type="submit" class="btn btn-default"><i class="fa fa-floppy-o"></i> Zapisz</button>
								    </div>
								  </div>
								</form>
                        	</div>
                        	<div class="col-md-3"></div>
                      	</div>

                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

{/block}

{block name="jQuery"}

    <script src="{$TEMPLATES}assets/js/moments.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap-datetimepicker.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap-datetimepicker.pl.js"></script>
	<script type="text/javascript">
	$(function () {
	    $('#datetimepicker1').datetimepicker({
            language: 'pl'
        });
	});
	</script>
{/block}