{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Nagrody</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
                <div class="col-md-12 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green">
                      <div class="panel-heading"><i class="fa fa-dashboard"></i> Panel Klienta</div>
                      <div class="panel-body padding-10">

	                      <div class="row">
                          	<div class="col-md-6 margin-top-20">
                            <!-- box -->
		                    <div class="panel panel-default panel-green">
		                      <div class="panel-heading"><i class="fa fa-user"></i> Moje konto</div>
		                      <div class="panel-body padding-10">
		                      	<div class="row">
                                	<div class="col-md-6">
		                      			<ul class="list-unstyled">
                                    		<li><a href="{$base_url}panel/dane.html">Moje dane</a></li>
                                    		<li><a href="{$base_url}panel/rezerwacje.html">Moje rezerwacje</a></li>
		                      			</ul>
                                	</div>
                                	<div class="col-md-6">
                                    Stan konta <span class="label label-info">{$userPoint}</span> pkt.
                                	</div>
		                      	</div>
		                      </div>
		                    </div>
                            <!-- box -->
                          	</div>
                          	<div class="col-md-6 margin-top-20">
                            <!-- box -->
		                    <div class="panel panel-default panel-green">
		                      <div class="panel-heading"><i class="fa fa-building-o"></i> Hotele</div>
		                      <div class="panel-body padding-10">
		                      		<p class="padding-10"><a href="{$base_url}hotele.html">{$hotele} obiekty oferuje swoje usługi w serwisie urloping.com</a></p>
		                      </div>
		                    </div>
                            <!-- box -->
                          	</div>
	                      </div>

	                      <div class="row">
                          	<div class="col-md-6 margin-top-20">
                            <!-- box -->
		                    <div class="panel panel-default panel-green">
		                      <div class="panel-heading"><i class="fa fa-dashboard"></i> Pakiety</div>
		                      <div class="panel-body padding-10">
		                      		Obecnie posiadamy {$pakiety} pakietów prywatnych na urlop
		                      </div>
		                    </div>
                            <!-- box -->
                          	</div>
                          	<div class="col-md-6 margin-top-20">
                            <!-- box -->
		                    <div class="panel panel-default panel-green">
		                      <div class="panel-heading"><i class="fa fa-dashboard"></i> Oferty specjalne</div>
		                      <div class="panel-body padding-10">
		                      		<ul class="list-unstyled">
                                    	<li><a href="{$base_url}okolicznosciowe.html">Pakiety okolicznościowe</a></li>
                                    	<li><a href="{$base_url}oferta_tygodnia.html">Oferta tygodnia</a></li>
                                    	<li><a href="{$base_url}">Najczęściej wybierane</a></li>
		                      		</ul>
		                      </div>
		                    </div>
                            <!-- box -->
                          	</div>
	                      </div>

                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

{/block}