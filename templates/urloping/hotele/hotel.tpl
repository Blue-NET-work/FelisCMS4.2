{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-gift"></i> {$name}</div>
          <div class="panel-body padding-10">
          	<div class="row">
            	<div class="col-md-8">
		            <!-- items -->
		            <div class="margin-bottom-20">
			        {if $id == 1}
			            {html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" class="img-thumbnail" width="40%" height="40%" alt=""}
		            {else}
			            {html_image file="{$uploads}/obiekty/6449fed60f8e0818e7aa6da1716f31699220768bs.jpg" class="img-thumbnail" width="40%" height="40%" alt=""}
			        {/if}
			        </div>

			        {$description}
		            <!-- items -->
            	</div>
            	<div class="col-md-4">
            	<p>
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
            	</p>
                    <h5>Na terenie obiektu znajduje się:</h5>
                    <ul class="fa-ul">
					  <li><i class="fa-li fa fa-check-square"></i>List icons (like these)</li>
					  <li><i class="fa-li fa fa-check-square"></i>can be used</li>
					  <li><i class="fa-li fa fa-check-square"></i>can be used</li>
					  <li><i class="fa-li fa fa-square"></i>default bullets in lists</li>
					</ul>
            	</div>
          	</div>

		    <!-- items -->
            <div class="margin-top-40">
                <h3>Pakiety</h3>
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
            	<span class="text-info">Obecnie brak pakietów dla wybranego hotelu</span>
            {/if}

            </div>
		    <!-- items -->

          </div>
        </div>

{/block}