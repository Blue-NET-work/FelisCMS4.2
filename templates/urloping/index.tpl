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
                        	<li><a href="#">Miasto</a></li>
                        	<li><a href="#">Miastowo</a></li>
                        	<li><a href="#">Miasto</a></li>
                        	<li><a href="#">Miastowo</a></li>
                        	<li><a href="#">Miasto</a></li>
                        	<li><a href="#">Miastowo</a></li>
                        	<li><a href="#">Miasto</a></li>
                        	<li><a href="#">Miastowo</a></li>
                        	<li><a href="#">Miasto</a></li>
                        	<li><a href="#">Miastowo</a></li>
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
                      <div class="panel-heading"><i class="fa fa-info"></i> Polecane obiekty</div>
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
                <!-- item -->
                <div class="row margin-bottom-20">
                	<div class="col-md-3">
                    	{html_image file="{$uploads}/najchetniej/7e26069718c3fc14ff9455bfac012c7aebd01efbm.jpg" alt="" height="40"}
                	</div>
                	<div class="col-md-6">
                    	<h4 class="packetInfo list-item-title"><a href="#" title="Wyjątkowy Pobyt SPA - 4*">10 dni - pełne wyżywienie - siłownia - basen - 8 zabiegów SPA - 4*</a></h4>
                	</div>
                	<div class="col-md-3 text-center">
	                    <p><b>1990.00 zł</b></p>
						+597 pkt
                	</div>
                </div>
                <!-- item -->
                <!-- item -->
                <div class="row margin-bottom-20">
                	<div class="col-md-3">
                    	{html_image file="{$uploads}/najchetniej/7e26069718c3fc14ff9455bfac012c7aebd01efbm.jpg" alt="" height="40"}
                	</div>
                	<div class="col-md-6">
                    	<h4 class="packetInfo list-item-title"><a href="#" title="Wyjątkowy Pobyt SPA - 4*">10 dni - pełne wyżywienie - siłownia - basen - 8 zabiegów SPA - 4*</a></h4>
                	</div>
                	<div class="col-md-3 text-center">
	                    <p><b>1990.00 zł</b></p>
						+597 pkt
                	</div>
                </div>
                <!-- item -->
                <!-- item -->
                <div class="row margin-bottom-20">
                	<div class="col-md-3">
                    	{html_image file="{$uploads}/najchetniej/7e26069718c3fc14ff9455bfac012c7aebd01efbm.jpg" alt="" height="40"}
                	</div>
                	<div class="col-md-6">
                    	<h4 class="packetInfo list-item-title"><a href="#" title="Wyjątkowy Pobyt SPA - 4*">10 dni - pełne wyżywienie - siłownia - basen - 8 zabiegów SPA - 4*</a></h4>
                	</div>
                	<div class="col-md-3 text-center">
	                    <p><b>1990.00 zł</b></p>
						+597 pkt
                	</div>
                </div>
                <!-- item -->
              </div>
            </div>

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-globe"></i> Przykładowe nagrody</div>
              <div class="panel-body text-center">
                <!-- items -->
                <div class="row">
                    <!-- item -->
                    <div class="col-md-3">
			            <div class="panel panel-default panel-green" id="polecaneObiekty">
			              <div class="panel-heading"></div>
			              <div class="panel-body">
	                        {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" alt=""}
	                        <h3>Skakanka</h3>
			                <div class="list-item-about"><p>Uniwersalny produkt marki profit. Możliwość regulacji długości skakanki. Uchwyty pokryte gumą antypoślizgową. Licznik wykonywanych obrotów. Możliwość zerowania wyniku po każdym użyciu.</p><p>Maksymalna długość 2,85 m</p></div>
			              </div>
			            </div>
                    </div>
                    <!-- item -->
                    <!-- item -->
                    <div class="col-md-3">
			            <div class="panel panel-default panel-green" id="polecaneObiekty">
			              <div class="panel-heading"></div>
			              <div class="panel-body">
	                        {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" alt=""}
	                        <h3>Skakanka</h3>
			                <div class="list-item-about"><p>Uniwersalny produkt marki profit. Możliwość regulacji długości skakanki. Uchwyty pokryte gumą antypoślizgową. Licznik wykonywanych obrotów. Możliwość zerowania wyniku po każdym użyciu.</p><p>Maksymalna długość 2,85 m</p></div>
			              </div>
			            </div>
                    </div>
                    <!-- item -->
                    <!-- item -->
                    <div class="col-md-3">
			            <div class="panel panel-default panel-green" id="polecaneObiekty">
			              <div class="panel-heading"></div>
			              <div class="panel-body">
	                        {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" alt=""}
	                        <h3>Skakanka</h3>
			                <div class="list-item-about"><p>Uniwersalny produkt marki profit. Możliwość regulacji długości skakanki. Uchwyty pokryte gumą antypoślizgową. Licznik wykonywanych obrotów. Możliwość zerowania wyniku po każdym użyciu.</p><p>Maksymalna długość 2,85 m</p></div>
			              </div>
			            </div>
                    </div>
                    <!-- item -->
                    <!-- item -->
                    <div class="col-md-3">
			            <div class="panel panel-default panel-green" id="polecaneObiekty">
			              <div class="panel-heading"></div>
			              <div class="panel-body">
	                        {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" alt=""}
	                        <h3>Skakanka</h3>
			                <div class="list-item-about"><p>Uniwersalny produkt marki profit. Możliwość regulacji długości skakanki. Uchwyty pokryte gumą antypoślizgową. Licznik wykonywanych obrotów. Możliwość zerowania wyniku po każdym użyciu.</p><p>Maksymalna długość 2,85 m</p></div>
			              </div>
			            </div>
                    </div>
                    <!-- item -->
                </div>
                <!-- items -->
              </div>
            </div>

{/block}