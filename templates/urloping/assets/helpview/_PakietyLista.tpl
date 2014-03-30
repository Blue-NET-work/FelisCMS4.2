
                		<tr>
                    		<td class="col-md-1">{html_image file="{$uploads}images/pakiety/thumb_70/{$item.pp_photo}.{$item.pp_ext}" class="img-thumbnail margin-top-10" width="100%" height="100%" alt="{$item.pp_alt}" title="{$item.pp_title}"}</td>
                    		<td>
                    			<h4><a href="{$base_url}pakiet/{$item.p_id}.html">{$item.p_name}</a></h4>
                            	{$item.p_description|truncate:220:"...":true}
                    		</td>
                    		<td class="col-md-1 text-center"><div class="margin-top-30">{$item.p_term} dni</div></td>
                    		<td class="col-md-1 text-center"><div class="margin-top-20"><p><strong>{$item.p_price} zł</strong></p>+ {$item.p_points} pkt</div></td>
                    		<td class="col-md-1 text-right"><div class="margin-top-30"><a href="{$base_url}pakiet/{$item.p_id}.html" class="btn btn-default btn-sm">Rezerwuj</a></div></td>
                		</tr>