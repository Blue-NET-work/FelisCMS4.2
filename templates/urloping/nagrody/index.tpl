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
                      <div class="panel-heading"><i class="fa fa-gift"></i> Dostepne nagrody</div>
                      <div class="panel-body padding-10 text-center">
                        <!-- items -->
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