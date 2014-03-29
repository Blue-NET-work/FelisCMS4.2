{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-search"></i> Rezerwacje</div>
              <div class="panel-body">
            {if $rezerwacje}
                <table class="table">
                {foreach from=$rezerwacje item=item name=rezerwacje}
                	<tr>
                    	<td class="col-md-1">{html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" class="img-thumbnail margin-top-10" width="100%" height="100%" alt=""}</td>
                    	<td>
                    		<h4><a href="{$base_url}panel/rezerwacja/{$item.r_id}.html">{$item.p_name}</a></h4>
                            {$item.p_description|truncate:220:"...":true}
                    	</td>
                    	<td class="col-md-1 text-center"><div class="margin-top-30">{$item.p_term} dni</div></td>
                    	<td class="col-md-2 text-center">
                    		<div class="margin-top-20">
                            {if $item.r_status == 2}
                                <span class="label label-success">Zatwierdzona</span>
		                    {elseif $item.r_status == 3}
		                        <span class="label label-danger">Odrzucona</span>
                            {elseif $item.r_status == 1}
                            	<span class="label label-info">Oczekuje na akceptacje hotelu.</span>
                            {else}
                            	<span class="label label-default">Oczekuje na wpłacenie zaliczki.</span>
                            {/if}
                    		</div>
                    	</td>
                	</tr>
                {/foreach}
                </table>
            {else}
            	<span class="text-info">Nie posiadasz jeszcze rezerwacji.</span>
            {/if}
              </div>
            </div>

{/block}