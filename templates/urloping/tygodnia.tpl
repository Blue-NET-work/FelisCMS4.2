{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-bell-o"></i> Oferta tygodnia</div>
          <div class="panel-body padding-10">
            <h3 class="margin-top-10 margin-bottom-25">{$pakiet.p_name}</h3>
          	<div class="row">
            	<div class="col-md-9">
		            <!-- items -->
		            <div class="row">
                    	<div class="col-md-7">

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
                    	<div class="col-md-5">
                    		<div class="row margin-top-10 margin-bottom-20">
                            	<div class="col-md-6">Pobyt {$pakiet.p_term} dni</div>
                            	<div class="col-md-6 text-center"><strong>{$pakiet.p_price} zł</strong><br>+ {$pakiet.p_points} pkt</div>
                    		</div>

                    		{$pakiet.p_description}

                            <div class="margin-top-20 text-center">
                    			<a href="{$base_url}panel/rezerwuj/{$pakiet.p_id}" class="btn btn-success">zamów</a>
                            </div>
                    	</div>
		            </div>
		            <!-- items -->
            	</div>
            	<div class="col-md-3">
            		<h4>O hotelu: {$hotel.name}</h4>
            	<p>
                    {if $hotel.stars == 5}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {elseif $hotel.stars == 4}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {elseif $hotel.stars == 3}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {elseif $hotel.stars == 2}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {else}
                        <i class="fa fa-star"></i>
                    {/if}
            	</p>
            		{$hotel.description}
                    <h4>Na terenie obiektu znajduje się:</h4>
                    <ul class="fa-ul">
					  <li>{$tags}</li>
					</ul>
            	</div>
          	</div>

          </div>
            </div>

{/block}