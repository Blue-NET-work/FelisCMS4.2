{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-coffee"></i> Pakiety okolicznościowe</div>
              <div class="panel-body">

              <div class="row margin-bottom-20">
              	<div class="col-md-3"></div>
              	<div class="col-md-6">
					<form class="form-inline" action="{$base_url}szukaj.html" role="form" method="POST">
					  <div class="form-group">
					    <label class="sr-only" for="region">region</label>
						<select class="form-control" name="region" id="region">
							<option value="0" selected="selected">region</option>
							<option value="2">Północ</option>
							<option value="3">Południe</option>
							<option value="4">Wschód</option>
							<option value="5">Zachód</option>
							<option value="6">Centrum</option>
						</select>
					  </div>
					  <div class="form-group">
					    <label class="sr-only" for="czas">czas</label>
						<select class="form-control" name="time" id="time">
							<option value="0" selected="selected">czas</option>
							<option value="3">3 dni</option>
							<option value="4">4 dni</option>
							<option value="5">5 dni</option>
							<option value="6">6 dni</option>
							<option value="7">7 dni</option>
							<option value="8">8 dni</option>
							<option value="9">9 dni</option>
							<option value="10">10 lub więcej dni</option>
						</select>
					  </div>
					  <div class="checkbox">
					    <label for="filterocc">
					     Okolicznościowy:  <input type="checkbox" name="p_occasional" id="filterocc" checked="checked" value="1">
					    </label>
					  </div>
					  <button type="submit" class="btn btn-default btn-sm">filtruj</button>
					</form>
              	</div>
              	<div class="col-md-3"></div>
              </div>

            {if $pakiety}
                <table class="table boxAction" id="pakiety">
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