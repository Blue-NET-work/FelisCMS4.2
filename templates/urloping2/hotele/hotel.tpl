{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$meta_title}</title>
{/block}

{block name="content"}

<!-- BEGIN HOTEL -->
<section id="hotel">
	<div class="container m-t-20 m-b-30">
		<h2>{$name}</h2>

		<div class="row">
			<!-- begin content -->
        	<div class="col-md-9 text-justify">

        			<div class="m-b-20">

						<div class="carousel slide article-slide" id="article-photo-carousel">
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner cont-slider">
							{foreach from=$hotels_photo item=item name=hotels_photo}
							<div class="item {if !$smarty.foreach.hotels_photo.first}{else}active{/if}">
							  {html_image file="{$uploads}images/hotels/thumb_735/{$item.hp_photo}.{$item.hp_ext}" class="img-thumbnail margin-top-10" style="height:350px !important; width:100%;" alt="{$item.hp_alt}" title="{$item.hp_title}"}
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

			        <h3>OPIS HOTELU</h3>
                    {$description}
        	</div>
            <!-- ./end content -->

        	<!-- begin sidebar -->
        	<div class="col-md-3">

            	<div class="naTerenie">
            		<h3>NA TERENIE OBIEKTU <span>ZNAJDUJĄ SIĘ</span></h3>

		            <ul class="fa-ul">
		              {foreach from=$tags item=item name=tags}
		              {if $item}
					  <li><i class="fa-li fa fa-check-square"></i> {$item}</li>
					  {/if}
					  {/foreach}
					</ul>
            	</div>

            	<div id="rating_container">
            		<h3>OCEŃ HOTEL</h3>
            		<p class="center_white">{if $voit != 0}{$voit} / 5{else}Brak ocen{/if}</p>
            		<p class="ocen_info">* oceń po zalogowaniu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    {if $userLogIn}
            		<span class="rating margin-top-25">
				      <a href="{$base_url}hotele/ocena/{$id}/1" class="fa fa-thumbs-o-up" title="1"></a>
				      <a href="{$base_url}hotele/ocena/{$id}/2" class="fa fa-thumbs-o-up" title="2"></a>
				      <a href="{$base_url}hotele/ocena/{$id}/3" class="fa fa-thumbs-o-up" title="3"></a>
				      <a href="{$base_url}hotele/ocena/{$id}/4" class="fa fa-thumbs-o-up" title="4"></a>
				      <a href="{$base_url}hotele/ocena/{$id}/5" class="fa fa-thumbs-o-up" title="5"></a>
				    </span>
				    {/if}
            	</div>


        	</div>
        	<!-- ./end sidebar -->
		</div>

	</div>
</section>
<!-- END HOTEL -->

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


            {*
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
            *}

{/block}

{block name="jQuery"}
{/block}