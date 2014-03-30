{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-search"></i> Wyniki wyszukiwania</div>
              <div class="panel-body">

              <div class="row margin-bottom-20">
              	<div class="col-md-3"></div>
              	<div class="col-md-6">
					<form class="form-inline" action="{$base_url}szukaj.html" role="form" method="POST">
					  <div class="form-group">
					    <label class="sr-only" for="region">region</label>
                        <select class="form-control" name="region" id="region">
                            <option value="0" {if $region == 0}selected="selected"{/if}>region</option>
                            <option value="2" {if $region == 2}selected="selected"{/if}>Północ</option>
                            <option value="3" {if $region == 3}selected="selected"{/if}>Góry</option>
                            <option value="4" {if $region == 4}selected="selected"{/if}>Wschód</option>
                            <option value="5" {if $region == 5}selected="selected"{/if}>Zachód</option>
                            <option value="6" {if $region == 6}selected="selected"{/if}>Centrum</option>
                        </select>
					  </div>
					  <div class="form-group">
					    <label class="sr-only" for="czas">czas</label>
                        <select class="form-control" name="time" id="time">
                            <option value="0" {if $term == 0}selected="selected"{/if}>czas</option>
                            <option value="3" {if $term == 3}selected="selected"{/if}>3 dni</option>
                            <option value="4" {if $term == 4}selected="selected"{/if}>4 dni</option>
                            <option value="5" {if $term == 5}selected="selected"{/if}>5 dni</option>
                            <option value="6" {if $term == 6}selected="selected"{/if}>6 dni</option>
                            <option value="7" {if $term == 7}selected="selected"{/if}>7 dni</option>
                            <option value="8" {if $term == 8}selected="selected"{/if}>8 dni</option>
                            <option value="9" {if $term == 9}selected="selected"{/if}>9 dni</option>
                            <option value="10" {if $term == 10}selected="selected"{/if}>10+ dni</option>
                        </select>
					  </div>
					  <div class="checkbox">
					    <label for="filterocc">
					     Okolicznościowy:  <input type="checkbox" name="p_occasional" id="filterocc" {if $p_occasional}checked="checked"{/if} value="1">
					    </label>
					  </div>
					  <button type="submit" class="btn btn-default btn-sm">filtruj</button>
					</form>
              	</div>
              	<div class="col-md-3"></div>
              </div>

            {if $pakiety}
                <table class="table">
                {foreach from=$pakiety item=item name=pakiety}
	            	{include file="assets/helpview/_PakietyLista.tpl" item=$item}
                {/foreach}
                </table>
            {else}
            	<span class="text-info">Nie ma jeszcze żadnego pakietu.</span>
            {/if}
              </div>
            </div>

{/block}