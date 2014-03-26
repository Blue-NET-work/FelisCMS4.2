{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-coffee"></i> Pakiety okolicznościowe</div>
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
            	<span class="text-info">Nie ma jeszcze żadnego pakietu.</span>
            {/if}
              </div>
            </div>

{/block}