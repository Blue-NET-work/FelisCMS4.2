{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Hotele</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-building-o"></i> Hotele</div>
              <div class="panel-body">
                <!-- items -->
                <div class="row">
                {foreach from=$hotele item=item name=hotele}
                    <!-- item -->
                    <div class="col-md-6">
			            <div class="panel panel-default panel-green">
			              <div class="panel-body padding-10">
				              <div class="row">
                              	<div class="col-md-6">
			                    {if $item.id == 1}
	                    			{html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" class="img-thumbnail" width="100%" height="100%" alt=""}
		                        {else}
	                    			{html_image file="{$uploads}/obiekty/6449fed60f8e0818e7aa6da1716f31699220768bs.jpg" class="img-thumbnail" width="100%" height="100%" alt=""}
			                    {/if}
	                    		</div>
                              	<div class="col-md-6">
	                        		<h3><a href="{$base_url}hotele/hotel/{$item.id}">{$item.name}</a></h3>
                                    <div>
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
                                    </div>

		                            {$item.description}
                              	</div>
				              </div>
			              </div>
			            </div>
                    </div>
                    <!-- item -->
                {/foreach}
                </div>
                <!-- items -->
              </div>
            </div>

{/block}