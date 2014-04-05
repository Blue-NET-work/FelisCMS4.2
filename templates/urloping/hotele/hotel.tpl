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
						    <li {if $smarty.foreach.pakiet_photo.first}class="active"{/if} data-slide-to="{$i++}" data-target="#article-photo-carousel">
						      {html_image file="{$uploads}images/hotels/thumb_70/{$item.hp_photo}.{$item.hp_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.hp_alt}" title="{$item.hp_title}"}
						    </li>
						{/foreach}
						  </ol>
						</div>

			        </div>
                    <div class="panel panel-default hotele">
                    	<div class="panel-body padding-20 text-justify">
			        		{$description}
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
		                  {foreach from=$tags item=item name=tags}
		                  {if $item}
						  <li><i class="fa-li fa fa-check-square"></i> {$item}</li>
						  {/if}
						  {/foreach}
						</ul>
            		</div>

            		<div id="rating_container">
            			<p class="center_white">{if $voit != 0}{$voit} / 5{else}Brak ocen{/if}</p>
            			<p class="ocen_info">* oceń po zalogowaniu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
            			{*<span class="rating margin-left-20">
				          <a href="{$base_url}hotele/ocena/{$id}/1" class="fa fa-star"></a>
				          <a href="{$base_url}hotele/ocena/{$id}/2" class="fa fa-star"></a>
				          <a href="{$base_url}hotele/ocena/{$id}/3" class="fa fa-star"></a>
				          <a href="{$base_url}hotele/ocena/{$id}/4" class="fa fa-star"></a>
				          <a href="{$base_url}hotele/ocena/{$id}/5" class="fa fa-star"></a>
				        </span> *}
            		</div>

            	</div>
          	</div>

		    <!-- items -->
            <div class="margin-top-40">
                <h3>Pakiety</h3>
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