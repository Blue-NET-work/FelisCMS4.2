{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Artykuły</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-align-justify"></i> Aktualności</div>
              <div class="panel-body">
	            {if $aktualnosci}
	                {foreach from=$aktualnosci item=item name=aktualnosci}
	                <div class="row">
				        <!-- item -->
		                <div class="col-md-12">
					      <h5><a href="{$base_url}artykul/{$item.a_alias}_{$item.a_id}.html">{$item.a_name}</a></h5>
					      <span style="font-size:10px;">Dodano: {$item.a_date}</span>
					      <div class="padding-5 margin-top-10 text-justify">
                          	{$item.a_description|truncate:590:"...":true}
					      </div>
                          <div class="text-right"><a href="{$base_url}artykul/{$item.a_alias}_{$item.a_id}.html" class="btn btn-green btn-sm"><i class="fa fa-file-text-o"></i> czytaj więcej >></a></div>
					    </div>
	                </div>
	                {/foreach}
	            {else}
            		<span class="text-info">Obecnie brak wpisów.</span>
	            {/if}
              </div>
            </div>

{/block}