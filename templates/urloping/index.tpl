{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
            	<div class="col-md-3 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="cityList">
                      <div class="panel-heading"><i class="fa fa-plane"></i> Miasta</div>
                      <div class="panel-body">
                        <!-- city -->
                        <ul class="list-unstyled">
		                {foreach from=$miasta item=item name=miasta}
                        	<li><a href="{$base_url}hotele/miasto/{$item.alias}.html">{$item.name}</a></li>
		                {/foreach}
                        </ul>
                        <!-- city -->
                      </div>
                    </div>
                    <!-- ./miasta -->
                    <!-- facebook -->
                    <h4><a title="Zobacz nasz profil na facebooku" href="https://www.facebook.com/pages/urlopingcom/411418285658498?fref=ts">Polub nas na facebooku</a></h4>
					<div class="fb-like fb_iframe_widget" data-href="https://www.facebook.com/pages/urlopingcom/411418285658498?fref=ts" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
                    <!-- ./facebook -->
                </div>
                <div class="col-md-4 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="polecaneObiekty">
                      <div class="panel-heading"><i class="fa fa-info fa-2x"></i> Polecane obiekty</div>
                      <div class="panel-body">
                        <!-- carusele -->
                        <div id="polecaneObiektyCarousel" class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
				                {foreach from=$obiekty item=item name=obiekty}
								<!-- item -->
								<div class="item {if $item.active == true}active{/if}">
	                                {html_image file="{$uploads}/obiekty/6449fed60f8e0818e7aa6da1716f31699220768bs.jpg" alt="" width="100%" height="100%"}
									<div class="carousel-caption">
										<h3><a href="{$base_url}hotele/hotel/{$item.id}" style="color:#fff;">{$item.name}</a></h3>
                                        <div class="row">
                                            <div class="col-md-8">{$item.pakiety} pakietów od {$item.price} zł</div>
                                            <div class="col-md-4 text-right">
                                    		{if $item.stars == 5}
                                    			<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    		{elseif $item.stars == 4}
                                    			<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    		{elseif $item.stars == 3}
                                    			<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    		{elseif $item.stars == 2}
                                    			<i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    		{else}
                                    			<i class="fa fa-star"></i>
                                    		{/if}
                                    		</div>
                                        </div>
									</div>
								</div>
								<!-- ./item -->
				                {/foreach}
							</div>

							<!-- Controls -->
							<a class="left carousel-control" href="#polecaneObiektyCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							</a>
							<a class="right carousel-control" href="#polecaneObiektyCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							</a>

							<!-- Indicators -->
							<ol class="carousel-indicators">
				                {foreach from=$obiekty item=item name=obiekty}
								<!-- item -->
								<li data-target="#polecaneObiektyCarousel" data-slide-to="{$item.item}" {if $item.active == true}class="active"{/if}></li>
								<!-- ./item -->
				                {/foreach}
							</ol>

						</div>
                        <!-- carusele -->
                      </div>
					  <div class="panel-footer">
					  </div>
                    </div>
                    <!-- ./miasta -->
                </div>
                <div class="col-md-5 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green">
                      <div class="panel-heading"><i class="fa fa-globe"></i> Mapa</div>
                      <div class="panel-body">
                        Panel content
                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-thumbs-o-up"></i> Najchętniej wybierane</div>
              <div class="panel-body">
	            {if $pakiety}
	                <table class="table">
	                {foreach from=$pakiety item=item name=pakiety}
	                	{include file="assets/helpview/_PakietyLista.tpl" item=$item}
	                {/foreach}
	                </table>
	            {else}
            		<span class="text-info">Obecnie brak pakietów dla wybranego hotelu</span>
	            {/if}
              </div>
            </div>

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-globe"></i> Przykładowe nagrody</div>
              <div class="panel-body text-center carousel slide" id="carousel-example-generic" data-ride="carousel">
                <!-- items -->
				  <!-- Indicators -->
				  <ol class="carousel-indicators">
				    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				    <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
				  </ol>

				  <!-- Wrapper for slides -->
				  <div class="carousel-inner">
				  <!-- item -->
				    <div class="item active">
		                <div class="row">
		                {foreach from=$nagrody item=item name=nagrody}
	                		{include file="assets/helpview/_NagrodyLista.tpl" item=$item}
		                {/foreach}
		                </div>
				    </div>
				    <div class="item">
		                <div class="row">
		                {foreach from=$nagrody item=item name=nagrody}
	                		{include file="assets/helpview/_NagrodyLista.tpl" item=$item}
		                {/foreach}
		                </div>
				    </div>
				  <!-- item -->
				  </div>

				  <!-- Controls -->
				  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
				    <span class="glyphicon glyphicon-chevron-left"></span>
				  </a>
				  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
				    <span class="glyphicon glyphicon-chevron-right"></span>
				  </a>
                <!-- items -->
              </div>
            </div>

{/block}