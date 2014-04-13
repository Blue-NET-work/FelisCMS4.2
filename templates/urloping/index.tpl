{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
	<link href="{$TEMPLATES}assets/css/mapa.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="{$TEMPLATES}assets/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
            	<div class="col-md-2 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="cityList">
                      <div class="panel-heading"><img src="{$TEMPLATES}assets/img/city.png" alt=""> Miasta</div>
                      <div class="panel-body" style="height: 330px;">
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
                    <h5><a title="Zobacz nasz profil na facebooku" href="https://www.facebook.com/urlopingcom">Polub nas na facebooku</a></h5>
					<div class="fb-like fb_iframe_widget" data-href="https://www.facebook.com/urlopingcom" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
                    <!-- ./facebook -->
                </div>
                <div class="col-md-5 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="polecaneObiekty">
                      <div class="panel-heading"><img src="{$TEMPLATES}assets/img/polecane.png" alt=""> Polecane obiekty</div>
                      <div class="panel-body">
                        <!-- carusele -->
                        <div id="polecaneObiektyCarousel" class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
				                {foreach from=$obiekty item=item name=obiekty}
								<!-- item -->
								<div class="item {if $item.active == true}active{/if}" style="max-height:390px">
	                                <div style="background: url('{$uploads}images/hotels/thumb_450/{$item.hp_photo}.{$item.hp_ext}'); background-position:center; background-repeat: no-repeat; background-size:100%; width:130%; height:370px; margin-left:auto; margin-right:auto; position:relative; left:-14%;"></div>
									<div class="carousel-caption">
                                        <div class="obiektyTop row">
                                        	<div class="col-md-8"><h3><a href="{$base_url}hotele/hotel/{$item.id}" style="color:#fff;">{$item.name}</a></h3></div>
                                        	<div class="col-md-4 text-right margin-top-20">
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
                                        <div class="row obiektyBottom">
                                            <div class="col-md-12">{$item.pakiety} pakietów od {$item.price} zł</div>
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
                      <div class="panel-heading"><img src="{$TEMPLATES}assets/img/mapa.png" alt=""> Mapa</div>
                      <div class="panel-body no-top-padding no-bottom-padding">
                        <div class="pakwypmap-map">
                        	<img src="{$TEMPLATES}assets/img/polska-map.png" alt="">
                        	<img id="transparent_map" src="{$TEMPLATES}assets/img/transp.gif" alt="" usemap="#polska">
	                        <map id="polska" name="polska">
		                        <area id="area_polnoc" shape="poly" coords="247,41,242,43,245,47,247,51,246,56,243,59,240,62,235,64,230,67,223,72,214,77,209,82,205,88,204,90,199,91,196,90,191,88,189,84,184,84,177,84,169,78,166,78,161,80,156,81,154,85,156,89,155,90,151,90,148,91,145,89,143,89,142,94,139,95,134,93,129,93,127,93,124,85,121,87,119,92,107,97,107,101,111,103,114,106,114,108,114,111,111,111,110,114,108,115,105,115,104,118,104,120,102,121,99,123,93,125,90,125,90,120,88,118,85,120,82,124,77,126,74,124,69,125,65,127,61,120,59,119,56,121,54,123,50,123,49,120,45,120,44,115,43,113,39,113,36,113,34,110,24,110,19,109,13,84,12,71,26,68,89,48,104,30,121,25,134,17,164,10,181,12,198,28,195,32,191,32,188,25,183,21,187,35,191,41,204,43,221,38,227,34,229,37,229,37" href="#region2" alt="Północ">
								<area id="area_poludnie" shape="poly" coords="34,201,47,193,51,194,55,197,57,201,63,202,69,201,74,205,85,215,98,221,105,225,106,226,102,230,105,235,113,237,120,236,127,237,132,234,141,238,146,243,143,248,145,255,151,258,157,263,158,260,162,255,164,257,164,263,166,263,168,264,173,265,179,265,192,269,200,271,213,273,226,275,230,278,233,282,239,284,249,289,253,298,255,301,264,303,268,300,268,297,271,301,277,306,288,305,297,303,299,306,303,303,312,302,315,304,315,307,319,308,321,309,322,312,323,315,327,318,331,319,336,321,342,322,346,318,349,317,355,316,357,315,361,316,363,317,350,344,349,363,358,383,344,382,318,368,305,357,289,355,283,361,275,366,269,359,264,358,257,360,251,364,248,371,236,373,224,365,228,359,219,350,212,357,198,359,179,330,165,322,158,325,153,321,142,309,146,306,135,307,125,299,129,309,113,318,102,317,85,289,96,285,84,285,74,279,65,275,58,275,52,262,51,266,46,273,37,273,35,262,43,247,42,233,31,228,30,218,24,206,27,203" href="#region3" alt="Góry">
								<area id="area_wschod" shape="poly" coords="248,40,246,43,245,46,248,50,248,53,245,60,237,63,232,67,223,73,226,75,226,79,224,83,227,86,236,83,243,94,248,97,257,93,260,97,264,101,264,109,261,109,261,114,262,126,270,138,278,143,281,140,287,139,291,137,296,139,296,143,296,145,305,146,312,151,314,165,310,171,312,180,308,188,311,200,307,201,309,207,307,213,309,222,318,237,314,241,310,245,310,254,310,264,313,271,311,274,306,282,302,289,297,289,294,293,291,294,288,298,285,299,280,300,272,302,279,306,288,305,296,302,299,306,303,303,315,303,317,307,322,309,324,315,330,319,334,319,337,321,342,320,346,317,354,315,363,317,379,310,401,291,402,263,382,234,383,206,386,189,365,177,380,161,393,156,397,130,386,99,380,75,377,55,368,46,359,40,349,37,337,41,299,44" href="#region4" alt="Wschód">
								<area id="area_zachod" shape="poly" coords="22,110,29,110,34,113,43,115,42,119,48,121,49,125,56,123,56,120,58,120,65,128,71,124,77,127,81,124,85,120,86,118,88,118,88,122,87,124,96,125,99,123,103,123,105,119,105,117,109,115,109,114,109,113,112,112,114,109,116,105,107,99,118,95,121,87,125,86,126,93,131,93,136,94,140,96,135,101,136,105,141,109,141,114,138,116,137,124,131,127,133,130,127,134,125,138,129,145,125,147,120,152,115,153,109,163,106,165,111,179,116,184,116,190,119,195,120,199,116,203,112,210,120,217,119,217,116,223,117,233,117,235,109,235,106,234,104,232,106,228,107,225,101,220,80,210,68,199,65,202,59,201,56,199,55,193,48,193,42,194,35,199,31,196,31,184,25,174,29,163,25,158,9,145,9,138,14,129,17,128" href="#region5" alt="Zachód">
								<area id="area_centrum" shape="poly" coords="223,75,226,77,225,81,224,83,226,86,236,85,242,93,242,95,248,99,258,93,262,101,264,103,263,109,259,109,260,113,261,117,260,126,276,144,279,143,281,141,285,139,291,138,294,139,295,142,295,144,299,147,306,147,312,156,312,166,309,170,311,181,306,189,311,200,306,201,307,206,308,207,305,213,305,220,317,237,316,240,310,243,308,247,311,271,309,276,304,286,298,289,293,293,289,294,288,299,283,299,278,301,273,301,269,297,266,301,264,302,255,299,249,289,239,283,234,283,230,277,218,273,189,268,166,263,164,256,162,255,158,260,156,262,144,252,146,248,147,243,133,234,127,236,117,236,117,224,119,216,111,209,115,207,115,204,121,201,121,194,117,192,118,183,111,181,108,165,113,161,113,157,122,153,127,148,129,142,126,136,133,132,133,128,137,125,141,115,142,113,143,110,137,103,143,97,144,89,151,93,152,91,155,92,155,83,162,81,167,78,178,86,187,84,189,89,194,90,199,94,207,90,211,81,218,76" href="#region6" alt="Centrum">
							</map>
							<ul class="pakwypmap regionslist">
								<li id="polnoc"><a href="#region2">Północ</a></li>
								<li id="poludnie" style="display: none;"><a href="#region3">Góry</a></li>
								<li id="wschod"><a href="#region4">Wschód</a></li>
								<li id="zachod" style="display: none;"><a href="#region5">Zachód</a></li>
								<li id="centrum" style="display: none;"><a href="#region6">Centrum</a></li>
							</ul>
							<div class="pakwypmap regioncont">
								<div id="region2" class="pakwypmap regioncities">
									<h4>Północ</h4>
									{if $mapa[2]}
									<ul class="pakwypmap citylist">
						                {foreach from=$mapa[2] item=item name=miasta}
										<li><a class="cityOnMap" style="top:280px;left:450px;" href="{$base_url}hotele/miasto/{$item.alias}.html" title="{$item.name}">{$item.name}</a></li>
						                {/foreach}
									</ul>
									{else}
									<p>Brak miast w tym regionie.</p>
									{/if}
								</div>
								<div id="region3" class="pakwypmap regioncities">
									<h4>Południe</h4>
									{if $mapa[3]}
									<ul class="pakwypmap citylist">
						                {foreach from=$mapa[3] item=item name=miasta}
										<li><a class="cityOnMap" style="top:280px;left:450px;" href="{$base_url}hotele/miasto/{$item.alias}.html" title="{$item.name}">{$item.name}</a></li>
						                {/foreach}
									</ul>
									{else}
									<p>Brak miast w tym regionie.</p>
									{/if}
								</div>
								<div id="region4" class="pakwypmap regioncities">
									<h4>Wschód</h4>
									{if $mapa[4]}
									<ul class="pakwypmap citylist">
						                {foreach from=$mapa[4] item=item name=miasta}
										<li><a class="cityOnMap" style="top:280px;left:450px;" href="{$base_url}hotele/miasto/{$item.alias}.html" title="{$item.name}">{$item.name}</a></li>
						                {/foreach}
									</ul>
									{else}
									<p>Brak miast w tym regionie.</p>
									{/if}
								</div>
								<div id="region5" class="pakwypmap regioncities">
									<h4>Zachód</h4>
									{if $mapa[5]}
									<ul class="pakwypmap citylist">
						                {foreach from=$mapa[5] item=item name=miasta}
										<li><a class="cityOnMap" style="top:280px;left:450px;" href="{$base_url}hotele/miasto/{$item.alias}.html" title="{$item.name}">{$item.name}</a></li>
						                {/foreach}
									</ul>
									{else}
									<p>Brak miast w tym regionie.</p>
									{/if}
								</div>
								<div id="region6" class="pakwypmap regioncities">
									<h4>Centrum</h4>
									{if $mapa[6]}
									<ul class="pakwypmap citylist">
						                {foreach from=$mapa[6] item=item name=miasta}
										<li><a class="cityOnMap" style="top:280px;left:450px;" href="{$base_url}hotele/miasto/{$item.alias}.html" title="{$item.name}">{$item.name}</a></li>
						                {/foreach}
									</ul>
									{else}
									<p>Brak miast w tym regionie.</p>
									{/if}
								</div>
							</div>
						</div>
                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

        	<div class="panel panel-default panel-green margin-top-10">
              <div class="panel-heading"><img src="{$TEMPLATES}assets/img/najchetniej.png" alt=""> Najchętniej wybierane</div>
              <div class="panel-body">
	            {if $pakiety}
					<div class="panel-group" id="accordion">
	                {foreach from=$pakiety item=item name=pakiety}
	            		{include file="assets/helpview/_PakietyLista.tpl" item=$item}
	                {/foreach}
					</div>
	            {else}
            		<span class="text-info">Obecnie brak pakietów dla wybranego hotelu</span>
	            {/if}
              </div>
            </div>

        	<div class="panel panel-default panel-green margin-top-10">
              <div class="panel-heading"><i class="fa fa-align-justify"></i> Aktualności</div>
              <div class="panel-body">
	            {if $aktualnosci}
	                <div class="row">
	                {foreach from=$aktualnosci item=item name=aktualnosci}
				        <!-- item -->
		                <div class="col-md-4">
					      <h5><a href="{$base_url}artykul/{$item.a_alias}_{$item.a_id}.html">{$item.a_name}</a></h5>
					      <span style="font-size:10px;">Dodano: {$item.a_date}</span>
					      <div class="padding-5 margin-top-10 text-justify">
                          	{$item.a_description|truncate:590:"...":true}
					      </div>
                          <div class="text-right"><a href="{$base_url}artykul/{$item.a_alias}_{$item.a_id}.html" class="btn btn-green btn-sm"><i class="fa fa-file-text-o"></i> czytaj więcej >></a></div>
					    </div>
	                {/foreach}
	                </div>
	            {else}
            		<span class="text-info">Obecnie brak wpisów.</span>
	            {/if}
	            <div class="text-right margin-top-20"><a href="{$base_url}artykuly.html" class="btn btn-default">więcej</a></div>
              </div>
            </div>

        	<div class="panel panel-default panel-green margin-top-10">
              <div class="panel-heading"><img src="{$TEMPLATES}assets/img/najchetniej.png" alt=""> Przykładowe nagrody</div>
              <div class="panel-body text-center no-top-padding no-bottom-padding">
                <!-- items -->
				<div id="slider1">
					<a class="buttons prev" href="#">&#60;</a>
					<div class="viewport">
						<ul class="overview list-unstyled list-inline">
				        {foreach from=$nagrody item=item name=nagrody}
				        	<!-- item -->
		                    <li class="col-md-3">
					            <div class="panel panel-default panel-green">
					              <div class="panel-heading"></div>
					              <div class="panel-body padding-10">
			                        <p>
                    		        {html_image file="{$uploads}images/nagrody/thumb_120/{$item.np_photo}.{$item.np_ext}" class="img-thumbnail margin-top-10" alt="{$item.np_alt}" title="{$item.np_title}"}
			                        </p>
			                        <h4><a href="{$base_url}nagrody/nagroda/{$item.id}">{$item.name}</a></h4>
		                            <div style="max-height:35px; overflow:hidden;">{$item.description|truncate:55:"...":true}</div>
		                            <div class="margin-top-10"><a href="{$base_url}nagrody/nagroda/{$item.id}" title="Zobacz szczegoly nagrody"><span class="price">{$item.npe_point} pkt / {$item.npe_price} zł</span></a></div>
					              </div>
					            </div>
		                    </li>
		                    <!-- item -->
				        {/foreach}
						</ul>
					</div>
					<a class="buttons next" href="#">&#62;</a>
				</div>
                <!-- items -->
              </div>
            </div>

{/block}
{block name="jQuery"}
    <script src="{$TEMPLATES}assets/js/plugins.js"></script>
    <!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/tinycarousel/lib/jquery.tinycarousel.js"></script>

	<!-- Add fancyBox -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

	<!-- Optionally add helpers - button, thumbnail and/or media -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

    <script type="text/javascript">
	$(document).ready(function(){
		if($('.pakwypmap-map')) {
		// Loop through each AREA in the imagemap
			$('.pakwypmap-map area').each(function() {
				$( this ).hoverIntent( function() {
				  var country_id = $(this).attr('id').replace('area_', '');
								$('#'+country_id).fadeIn('medium');
				}, function() {
				  var country_id = $(this).attr('id').replace('area_', '');
								$('#'+country_id).fadeOut('fast');
				});
				// Assigning an action to the click event
			});
			$('.pakwypmap-map area').fancybox({ 'autoDimensions' : true });
			$('.pakwypmap-map ul.regionslist>li>a').fancybox({ 'autoDimensions' : true });
		};

			$('#slider1').tinycarousel({ interval: true });
	});
	</script>
{/block}
