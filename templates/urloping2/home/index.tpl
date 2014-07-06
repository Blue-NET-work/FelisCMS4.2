{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

<!-- BEGIN NAJCHĘTNIEJ WYBIERANE -->
<section id="najchetniej-wybierane">
	<div class="container">
		<!-- belka nav -->
		<div class="row">
			<div class="col-md-6"><h4> Najchętniej <span>wybierane</span></h4></div>
			<div class="col-md-6">
			</div>
		</div>
		<!-- belka nav -->
		<!-- pozycje wybieranych -->
		<ul class="bxslider row m-t-20">
	    {foreach from=$pakiety item=item name=pakiety}
			<li>
				<em>
					{html_image file="{$uploads}images/pakiety/thumb_280/{$item.pp_photo}.{$item.pp_ext}" alt="{$item.pp_alt}" title="{$item.pp_title}" class="thumbnail"}
					<a href="{$base_url}pakiet/{$item.p_id}.html"><i class="fa fa-link icon-hover icon-hover-1"></i></a>
				</em>
				<a class="bxslider-block" href="{$base_url}pakiet/{$item.p_id}.html">
					<div style="min-height: 70px;">
						<strong>{$item.p_name}</strong>
					</div>
					<table class="table m-t-20">
        				<tr>
        					<td class="text-center">{$item.p_term} dni</td>
			                <td class="text-center"><strong>{$item.p_price} zł</strong></td>
			                <td class="text-center">+ {$item.p_points} pkt</td>
			            </tr>
					</table>
				</a>
			</li>
	    {foreachelse}
	    	<span class="text-info">Obecnie brak pakietów dla wybranego hotelu</span>
	    {/foreach}
		</ul>
		<!-- pozycje wybieranych -->
	</div>
</section>
<!-- END NAJCHĘTNIEJ WYBIERANE -->


<!-- BEGIN ARTICLES -->
<section id="articles">
	<div class="articlesIcon"></div>
	<div class="container">
		<h4>Aktualności</h4>
		<div class="row">
			{foreach from=$aktualnosci item=item name=aktualnosci}
			<!-- article -->
			<div class="col-md-4">
				<h5><a href="{$base_url}artykul/{$item.a_alias}_{$item.a_id}.html">{$item.a_name}</a></h5>
				{html_image file="{$uploads}images/artykuly/{$item.a_images}" alt="{$item.a_name}" title="{$item.a_name}" class="thumbnail" width="100%" height="100%"}
				<div class="text-justify">
					{$item.a_description|truncate:334:"...":true}
					<a href="{$base_url}artykul/{$item.a_alias}_{$item.a_id}.html" class="more fa fa-angle-double-right"></a>
				</div>
			</div>
			<!-- ./end article -->
			{foreachelse}
			<div class="col-md-12 text-info">Obecnie brak wpisów.</div>
			{/foreach}
		</div>
	</div>
</section>
<!-- END ARTICLES -->


<!-- BEGIN POLECANE PAKIETY -->
<section id="polecane-pakiety">
	<div class="container">
		<!-- belka nav -->
		<div class="row">
			<div class="col-md-6"><h4> Polecane <span>pakiety</span></h4></div>
			<div class="col-md-6">
			</div>
		</div>
		<!-- belka nav -->
		<!-- pozycje wybieranych -->
		<ul class="bxslider row m-t-20">
			{foreach from=$obiekty item=item name=obiekty}
			<li>
				<em>
					{html_image file="{$uploads}images/hotels/thumb_280/{$item.hp_photo}.{$item.hp_ext}" alt="{$item.hp_alt}" title="{$item.hp_title}" class="thumbnail"}
					<a href="{$base_url}hotele/hotel/{$item.id}"><i class="fa fa-link icon-hover icon-hover-1"></i></a>
				</em>
				<a class="bxslider-block" href="{$base_url}hotele/hotel/{$item.id}">
					<strong>{$item.name}</strong>
				</a>
			</li>
			{foreachelse}
			<div class="col-md-12 text-info">Obecnie brak wpisów.</div>
			{/foreach}
		</ul>
		<!-- pozycje wybieranych -->
	</div>
</section>
<!-- END POLECANE PAKIETY -->


{/block}

{block name="jQuery"}
{/block}
