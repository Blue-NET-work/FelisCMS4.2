{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-ticket"></i> {$pakiet.p_name}</div>
          <div class="panel-body padding-10">

		        <!-- items -->
		        <div class="row">
                    <div class="col-md-6">

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
                    <div class="col-md-6">
                    	<div class="row margin-top-10 margin-bottom-20">
                            <div class="col-md-6">Pobyt {$pakiet.p_term} dni</div>
                            <div class="col-md-6 text-center"><strong>{$pakiet.p_price} zł</strong><br>+ {$pakiet.p_points} pkt</div>
                    	</div>

                    	{$pakiet.p_description}

                        <div class="margin-top-20 text-center">
                    		<a href="{$base_url}panel/rezerwuj/{$pakiet.p_id}" class="btn btn-success btn-sm">zamów</a>
                        </div>
                    </div>
		        </div>
		        <!-- items -->

          </div>
        </div>

{/block}
{block name="jQuery"}
	<script>
// Stop carousel
$('.carousel').carousel({
  interval: false
});</script>
{/block}