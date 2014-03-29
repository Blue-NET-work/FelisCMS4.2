
		                    <!-- item -->
		                    <div class="col-md-3">
					            <div class="panel panel-default panel-green">
					              <div class="panel-heading"></div>
					              <div class="panel-body padding-10">
			                        <p>
                    		        {html_image file="{$uploads}images/nagrody/thumb_120/{$item.np_photo}.{$item.np_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.np_alt}" title="{$item.np_title}"}
			                        </p>
			                        <h3><a href="{$base_url}nagrody/nagroda/{$item.id}">{$item.name}</a></h3>
		                            {$item.description|truncate:55:"...":true}
		                            <p><a href="{$base_url}nagrody/nagroda/{$item.id}" title="Zobacz szczegoly nagrody"><span class="price">{$item.npe_point} pkt / {$item.npe_price} zł</span></a></p>
					              </div>
					            </div>
		                    </div>
		                    <!-- item -->