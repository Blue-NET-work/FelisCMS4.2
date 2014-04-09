{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-ticket"></i> {$pakiet.p_name}</div>
          <div class="panel-body padding-10">

          	<div class="row">
            	<div class="col-md-8">
		            <!-- items -->
		            <div class="margin-bottom-20">

						<div class="carousel slide article-slide" id="article-photo-carousel">
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner cont-slider">
						{foreach from=$hotels_photo item=item name=hotels_photo}
						    <div class="item {if !$smarty.foreach.hotels_photo.first}{else}active{/if}">
						      {html_image file="{$uploads}images/hotels/thumb_450/{$item.hp_photo}.{$item.hp_ext}" class="img-thumbnail margin-top-10" style="height:350px !important; width:100%;" alt="{$item.hp_alt}" title="{$item.hp_title}"}
						    </div>
						{/foreach}
						  </div>

						  <!-- Indicators -->
						  <ol class="carousel-indicators">
						  {$i = 0}
						{foreach from=$hotels_photo item=item name=hotels_photo}
						    <li {if $smarty.foreach.hotels_photo.first}class="active"{/if} data-slide-to="{$i++}" data-target="#article-photo-carousel">
						      {html_image file="{$uploads}images/hotels/thumb_70/{$item.hp_photo}.{$item.hp_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.hp_alt}" title="{$item.hp_title}"}
						    </li>
						{/foreach}
						  </ol>
						</div>

			        </div>
                    <div class="panel panel-default hotele">
                    	<h4 class="margin-left-20">{$hotel.name}</h4>
                    	<div class="panel-body padding-20 text-justify">
			        		{$hotel.description}
                    	</div>
                    </div>
		            <!-- items -->
            	</div>
            	<div class="col-md-4">
            	{*<p>
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
            	</p>*}

            		<div class="naTerenie">
		                <ul class="fa-ul">
		                  {foreach from=$hotel.tags item=item name=tags}
		                  {if $item}
						  <li><i class="fa-li fa fa-check-square"></i> {$item}</li>
						  {/if}
						  {/foreach}
						</ul>
            		</div>

            		<div id="rating_container">
            			<p class="center_white">{if $hotel.voit != 0}{$hotel.voit} / 5{else}Brak ocen{/if}</p>
            			<p class="ocen_info">* oceń po zalogowaniu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                        {if $userLogIn}
            			<span class="rating margin-top-25">
				          <a href="{$base_url}hotele/ocena/{$hotel.id}/1" class="fa fa-star" title="1"></a>
				          <a href="{$base_url}hotele/ocena/{$hotel.id}/2" class="fa fa-star" title="2"></a>
				          <a href="{$base_url}hotele/ocena/{$hotel.id}/3" class="fa fa-star" title="3"></a>
				          <a href="{$base_url}hotele/ocena/{$hotel.id}/4" class="fa fa-star" title="4"></a>
				          <a href="{$base_url}hotele/ocena/{$hotel.id}/5" class="fa fa-star" title="5"></a>
				        </span>
				        {/if}
            		</div>

            	</div>
          	</div>


		        <!-- items -->
		        <div class="row">
                    <div class="col-md-6 margin-top-30">

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
                    <div class="col-md-6 margin-top-30">
                    	<div class="row margin-top-10 margin-bottom-20" style="font-size:15px;">
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

		    <!-- items -->
            <div class="margin-top-40">
                <h3>Inne pakiety hotelu</h3>
            {if $pakiety}
				<div class="panel-group" id="accordion">
                {foreach from=$pakiety item=item name=pakiety}
	            	{include file="assets/helpview/_PakietyLista.tpl" item=$item}
                {/foreach}
				</div>
            {else}
            	<span class="text-info">Obecnie brak pakietów dla wybranego hotelu</span>
            {/if}

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