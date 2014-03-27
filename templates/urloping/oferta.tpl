{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-search"></i> Wyniki wyszukiwania</div>
              <div class="panel-body">
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