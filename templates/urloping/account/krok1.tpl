{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Krok 1</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
                <div class="col-md-12 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="polecaneObiekty">
                      <div class="panel-heading"><i class="fa fa-user"></i> Moje dane</div>
                      <div class="panel-body padding-10">

{include file="assets/helpview/messages.tpl" messages=$messages}

                      	<div class="row margin-top-20">
                        	<div class="col-md-12 text-center">
                               <p>Zamówienie zostało dokonane. Oczekuje na akceptacje, poinformujemy Cię mailowo o statusie realizacji.</p>
                        	</div>
                      	</div>

                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

{/block}