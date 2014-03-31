{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Nagrody</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
                <div class="col-md-9 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green">
                      <div class="panel-heading"><i class="fa fa-gift"></i> {$name}</div>
                      <div class="panel-body padding-10">


		        <!-- items -->
		        <div class="row">
                    <div class="col-md-6">

<div class="carousel slide article-slide" id="article-photo-carousel">
  <!-- Wrapper for slides -->
  <div class="carousel-inner cont-slider">
{foreach from=$nagroda_photo item=item name=nagroda_photo}
    <div class="item {if !$smarty.foreach.nagroda_photo.first}{else}active{/if}">
      {html_image file="{$uploads}images/nagrody/thumb_800/{$item.np_photo}.{$item.np_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.np_alt}" title="{$item.np_title}"}
    </div>
{/foreach}
  </div>

  <!-- Indicators -->
  <ol class="carousel-indicators">
  {$i = 0}
{foreach from=$nagroda_photo item=item name=nagroda_photo}
    <li {if $smarty.foreach.nagroda_photo.first}class="active"{/if} data-slide-to="{$i++}" data-target="#article-photo-carousel">
      {html_image file="{$uploads}images/nagrody/thumb_70/{$item.np_photo}.{$item.np_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.np_alt}" title="{$item.np_title}"}
    </li>
{/foreach}
  </ol>
</div>
                    </div>
                    <div class="col-md-6">
                    	<h3>{$name}</h3>
	                    {$description}

	                    <form class="margin-top-20" action="{$base_url}panel/dodaj.html" method="post">
					        <input type="hidden" name="date[id]" value="nagroda_{$id}">
					        <input type="hidden" name="date[name]" value="{$name}">
					        <select class="form-control input-sm" name="date[price]">
							{foreach from=$nagroda_price item=item name=nagroda_price}
								<option value="{$item.npe_price}">{$item.npe_point} pkt / {$item.npe_price} zł</option>
							{/foreach}
							</select>
					        <input type="hidden" name="date[qty]" value="1">
					        <button type="submit" id="loading-example-btn" class="btn btn-default btn-sm margin-top-10" data-loading-text="Loading...">wybierz</button>
					    </form>
                    </div>
		        </div>
		        <!-- items -->



                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
                <div class="col-md-3 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green">
                      <div class="panel-body">
						<h4>Jak zbierać punkty?</h4>
						<p>Nie wiesz jak zebrać punkty? Zapoznaj się z prostym przewodnikiem klikając w link poniżej</p>
						<a title="Jak zbierać punkty - poradnik" href="{$base_url}co-z-tymi-nagrodami.html">więcej...</a>
                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

{/block}