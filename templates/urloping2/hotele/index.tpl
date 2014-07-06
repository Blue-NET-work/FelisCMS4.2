{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Hotele</title>
{/block}

{block name="content"}



<section id="hotele">
    <div class="container">
	    <div class="row">
    		<div class="col-md-3">

    		<div class="panel panel-default">
			  <div class="panel-heading">Panel heading without title</div>
			  <div class="panel-body">
			    Panel content
			  </div>
			</div>

    		</div>
    		<div class="col-md-9">
				<!-- belka nav -->
				<div class="row">
					<div class="col-md-6"><h4><i class="fa fa-building-o"></i> Hotele</h4></div>
					<div class="col-md-6">
					</div>
				</div>
				<!-- belka nav -->
				<!-- pozycje wybieranych -->
				<div class="row m-t-20">
					{foreach from=$hotele item=item name=hotele}
					<div class="col-md-3">
						{html_image file="{$uploads}images/hotels/thumb_280/{$item.hp_photo}.{$item.hp_ext}" class="thumbnail" alt="{$item.hp_alt}" title="{$item.hp_title}"}
					    <a class="bxslider-block" href="{$base_url}hotele/hotel/{$item.id}">
							<strong>{$item.name}
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
		                    {/if}</strong>
							{$item.description|truncate:55:"...":true}
						</a>
					</div>
					{foreachelse}
					<div class="col-md-12 text-info">Obecnie brak wpisów.</div>
					{/foreach}
				</div>
				<!-- pozycje wybieranych -->
	        </div>
	    </div>
    </div>
</section>
{/block}

{block name="jQuery"}
{/block}
