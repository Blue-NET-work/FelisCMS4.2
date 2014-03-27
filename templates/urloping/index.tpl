{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
            	<div class="col-md-2 margin-top-20">
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
                <div class="col-md-5 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="polecaneObiekty">
                      <div class="panel-heading"><i class="fa fa-info fa-2x"></i> Polecane obiekty</div>
                      <div class="panel-body">
                        <!-- carusele -->
                        <div id="polecaneObiektyCarousel" class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<!-- item -->
								<div class="item active">
	                                {html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" alt="" width="100%"}
									<div class="carousel-caption">
									...
									</div>
								</div>
								<!-- ./item -->
								<!-- item -->
								<div class="item">
	                                {html_image file="{$uploads}/obiekty/6449fed60f8e0818e7aa6da1716f31699220768bs.jpg" alt="" width="100%"}
									<div class="carousel-caption">
									...
									</div>
								</div>
								<!-- ./item -->
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
								<li data-target="#polecaneObiektyCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#polecaneObiektyCarousel" data-slide-to="1"></li>
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
                		<tr>
                    		<td class="col-md-2">{html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" class="img-thumbnail" width="60%" height="60%" alt=""}</td>
                    		<td><a href="{$base_url}pakiet/{$item.p_id}">{$item.p_name}</a></td>
                    		<td class="col-md-1 text-center">{$item.p_term} dni</td>
                    		<td class="col-md-2 text-center"><p><strong>{$item.p_price} zł</strong></p>+ {$item.p_points} pkt</td>
                    		<td class="col-md-2 text-right"><a href="{$base_url}pakiet/{$item.p_id}" class="btn btn-success">Rezerwuj</a></td>
                		</tr>
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
		                    <!-- item -->
		                    <div class="col-md-3">
					            <div class="panel panel-default panel-green" id="polecaneObiekty">
					              <div class="panel-heading"></div>
					              <div class="panel-body padding-10">
			                        <p>
		                            {if $item.id == 1}
			                            {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" class="img-thumbnail" alt=""}
		                            {elseif $item.id == 2}
			                            {html_image file="{$uploads}/nagrody/f4a607b6aa9d4368d439ff84544716c2cdd4823fm.png" class="img-thumbnail" alt=""}
		                            {else}
			                            {html_image file="{$uploads}/nagrody/a1f14b85de722d7aed551c7408ca9375f4589aeam.png" class="img-thumbnail" alt=""}
		                            {/if}
			                        </p>
			                        <h3><a href="{$base_url}nagrody/nagroda/{$item.id}">{$item.name}</a></h3>
		                            {$item.description|truncate:55:"...":true}
		                            <p><a href="{$base_url}nagrody/nagroda/{$item.id}" title="Zobacz szczegoly nagrody"><span class="price">{$item.price} pkt</span></a></p>
					              </div>
					            </div>
		                    </div>
		                    <!-- item -->
		                {/foreach}
		                </div>
				    </div>
				    <div class="item">
		                <div class="row">
		                {foreach from=$nagrody item=item name=nagrody}
		                    <!-- item -->
		                    <div class="col-md-3">
					            <div class="panel panel-default panel-green" id="polecaneObiekty">
					              <div class="panel-heading"></div>
					              <div class="panel-body padding-10">
			                        <p>
		                            {if $item.id == 1}
			                            {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" class="img-thumbnail" alt=""}
		                            {elseif $item.id == 2}
			                            {html_image file="{$uploads}/nagrody/f4a607b6aa9d4368d439ff84544716c2cdd4823fm.png" class="img-thumbnail" alt=""}
		                            {else}
			                            {html_image file="{$uploads}/nagrody/a1f14b85de722d7aed551c7408ca9375f4589aeam.png" class="img-thumbnail" alt=""}
		                            {/if}
			                        </p>
			                        <h3><a href="{$base_url}nagrody/nagroda/{$item.id}">{$item.name}</a></h3>
		                            {$item.description|truncate:55:"...":true}
		                            <p><a href="{$base_url}nagrody/nagroda/{$item.id}" title="Zobacz szczegoly nagrody"><span class="price">{$item.price} pkt</span></a></p>
					              </div>
					            </div>
		                    </div>
		                    <!-- item -->
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