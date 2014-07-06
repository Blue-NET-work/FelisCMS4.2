{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$pakiet.p_name}</title>
{/block}

{block name="content"}

<!-- BEGIN OFERTA TYGODNIA -->
<section id="oferta-tygodnia">
	<div class="container">
		<!-- belka nav -->
		<div class="row">
			<div class="col-md-6"><h4> Oferta <span>Tygodnia</span></h4></div>
			<div class="col-md-6 text-right m-t-15">
				<div class="fb-share-button" data-href="{$base_url}oferta_tygodnia.html" data-type="button_count"></div>
			</div>
		</div>
		<!-- belka nav -->
		<!-- pozycje wybieranych -->
            <h3 class="m-t-40 m-b-35">{$pakiet.p_name}</h3>

		        <!-- items -->
		        <div class="row">
                    <div class="col-md-5">

<div class="carousel slide article-slide" id="article-photo-carousel">
  <!-- Wrapper for slides -->
  <div class="carousel-inner cont-slider">
{foreach from=$pakiet_photo item=item name=pakiet_photo}
    <div class="item {if !$smarty.foreach.pakiet_photo.first}{else}active{/if}">
      {html_image file="{$uploads}images/pakiety/thumb_800/{$item.pp_photo}.{$item.pp_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.pp_alt}" title="{$item.pp_title}"}
    </div>
{/foreach}
  </div>

  <!-- Indicators -->
  <ol class="carousel-indicators">
  {$i = 0}
{foreach from=$pakiet_photo item=item name=pakiet_photo}
    <li {if $smarty.foreach.pakiet_photo.first}class="active"{/if} data-slide-to="{$i++}" data-target="#article-photo-carousel">
      {html_image file="{$uploads}images/pakiety/thumb_70/{$item.pp_photo}.{$item.pp_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.pp_alt}" title="{$item.pp_title}"}
    </li>
{/foreach}
  </ol>
</div>
                    </div>
                    <div class="col-md-7">
                    	<div class="row m-t-10 m-b-20" style="font-size:15px;">
                            <div class="col-md-6">Pobyt {$pakiet.p_term} dni</div>
                            <div class="col-md-4 col-md-offset-2 text-center"><strong>{$pakiet.p_price} zł</strong><br>+ {$pakiet.p_points} pkt</div>
                    	</div>

                    	{$pakiet.p_description}

                        <div class="m-t-20 text-center">
                    		<a href="{$base_url}panel/rezerwuj/{$pakiet.p_id}" class="btn btn-success btn-sm">zamów</a>
                        </div>
                    </div>
		        </div>
		        <!-- items -->
		<!-- pozycje wybieranych -->
	</div>
</section>
<!-- END OFERTA TYGODNIA -->

{/block}

{block name="jQuery"}
{/block}
