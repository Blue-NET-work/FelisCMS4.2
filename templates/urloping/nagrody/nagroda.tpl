{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Nagrody</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
                <div class="col-md-9 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green">
                      <div class="panel-heading"><i class="fa fa-gift"></i> {$name}</div>
                      <div class="panel-body padding-10">
                        <!-- items -->
                        {if $id == 1}
	                        {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" class="img-thumbnail margin-right-10" align="left" alt=""}
                        {elseif $id == 2}
	                        {html_image file="{$uploads}/nagrody/f4a607b6aa9d4368d439ff84544716c2cdd4823fm.png" class="img-thumbnail margin-right-10" align="left" alt=""}
                        {else}
	                        {html_image file="{$uploads}/nagrody/a1f14b85de722d7aed551c7408ca9375f4589aeam.png" class="img-thumbnail margin-right-10" align="left" alt=""}
                        {/if}

	                    {$description}

                        <hr>
                        <div class="row margin-top-25">
                        	<div class="col-md-1"></div>
                        	<div class="col-md-4">
                        		Koszt: {$price} pkt
                        	</div>
                        	<div class="col-md-4">
	                            <form action="{$base_url}panel/dodaj.html" method="post">
					                <input type="hidden" name="date[id]" value="nagroda_{$id}">
					                <input type="hidden" name="date[name]" value="{$name}">
					                <input type="hidden" name="date[price]" value="{$price}">
					                <input type="hidden" name="date[qty]" value="1">
					                <button type="submit" id="loading-example-btn" class="btn btn-default" data-loading-text="Loading...">wybierz</button>
					            </form>
                        	</div>
                        	<div class="col-md-1"></div>
                        </div>

                        <!-- items -->
                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
                <div class="col-md-3 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green">
                      <div class="panel-body">
						<h4>Jak zbierać punkty?</h4>
						<p>Nie wiesz jak zebrać punkty? Zapoznaj się z prostym przewodnikiem klikając w link poniżej</p>
						<a title="Jak zbierać punkty - poradnik" href="?s=jak-to-dziala,Coztyminagrodami">więcej...</a>
                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

{/block}