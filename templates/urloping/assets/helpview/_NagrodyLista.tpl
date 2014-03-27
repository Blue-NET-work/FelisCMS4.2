
		                    <!-- item -->
		                    <div class="col-md-3">
					            <div class="panel panel-default panel-green">
					              <div class="panel-heading"></div>
					              <div class="panel-body padding-10">
			                        <p>
		                            {if $item.id == 1}
			                            {html_image file="{$uploads}/nagrody/4065a25c125c699eb366767811b09dd32cce3898m.jpg" class="img-thumbnail" alt=""}
		                            {elseif $item.id == 2}
			                            {html_image file="{$uploads}/nagrody/f4a607b6aa9d4368d439ff84544716c2cdd4823fm.png" class="img-thumbnail" alt=""}
		                            {else}
			                            {html_image file="{$uploads}/nagrody/a1f14b85de722d7aed551c7408ca9375f4589aeam.png" class="img-thumbnail" alt=""}
		                            {/if}
			                        </p>
			                        <h3><a href="{$base_url}nagrody/nagroda/{$item.id}">{$item.name}</a></h3>
		                            {$item.description|truncate:55:"...":true}
		                            <p><a href="{$base_url}nagrody/nagroda/{$item.id}" title="Zobacz szczegoly nagrody"><span class="price">{$item.price} pkt</span></a></p>
					              </div>
					            </div>
		                    </div>
		                    <!-- item -->