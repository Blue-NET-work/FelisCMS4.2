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
                        		<p>Aby dokonać rezerwacji prosimy o wybranie daty rozpoczęcia wypoczynku.</p>

	                            <form class="form-horizontal" role="form" method="POST">
	                            	<!-- pole -->
								  <div class="form-group">
								    <label for="inputFirst" class="col-sm-4 control-label">Data rozpoczęcia</label>
								    <div class="col-sm-8">
						                <div class='input-group date' id='datetimepicker1'>
						                    <input type='text' class="form-control" name="r_date" data-date-format="YYYY-MM-DD" id="dateReserv">
						                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						                </div>
						                <div id="dateReservInfo"></div>
								    </div>
								  </div>
	                            	<!-- pole -->

								  <div class="form-group">
								    <div class="col-sm-offset-4 col-sm-8">
								      <button type="submit" class="btn btn-default"><i class="fa fa-pencil"></i> Zarezerwuj</button>
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

    <script src="{$TEMPLATES}assets/js/moment.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap-datetimepicker.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap-datetimepicker.pl.js"></script>
	<script type="text/javascript">
	$(function () {
	    $('#datetimepicker1').datetimepicker({
	    	pickTime: false,
            language: 'pl'
        });
	});
	</script>
{/block}