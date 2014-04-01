                <form action="" method="POST">
                <!-- tab -->
                <div class="tab-content with-padding">
                    <div class="tab-pane fade in active" id="data">
                        <div class="row">
                            <div class="col-md-6">

                                <p><b>{lang line="default_meta_data"}
                                <span class="info-spot">
                                    <span class="icon-info-round"></span>
                                    <span class="info-bubble">
                                        {lang line="default_meta_data_info"}
                                    </span>
                                </span>
                                </b></p>

                                <div class="form-group block-label">
                                    <label for="item[meta_title]" class="text-info">{lang line="default_title_site"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[meta_title]" id="item[meta_title]" class="input form-control" value="{$page.meta_title}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[meta_keywords]" class="text-info">{lang line="default_meta_keywords"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[meta_keywords]" id="item[meta_keywords]" class="input form-control" value="{$page.meta_keywords}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[meta_description]" class="text-info">{lang line="default_meta_description"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[meta_description]" id="item[meta_description]" class="input form-control" value="{$page.meta_description}">
                                </div>

                            </div><!-- ./end span6 -->
                            <div class="col-md-6">

                                <p><b>{lang line="default_site_data"}</b></p>

                                <div class="form-group block-label">
                                    <label for="item[p_name]" class="text-info">{lang line="default_name"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[p_name]" id="item[p_name]" class="input form-control FelisNazwa" value="{$page.p_name}">
                                </div>

                                <div class="form-group has-feedback block-label">
                                    <label for="item[p_alias]" class="text-info">{lang line="default_show_adres"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[p_alias]" id="item[p_alias]" class="input form-control FelisAlias" value="{$page.p_alias}">
  									<span id="FelisAlias" class="fa fa-spinner fa-spin form-control-feedback"></span>
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[p_price]" class="text-info">Cena: <small>(np. 100 // bez zł)</small></label>
                                    <input type="text" name="item[p_price]" id="item[p_price]" class="input form-control" value="{$page.p_price}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[p_points]" class="text-info">Punktów: <small>(np. 100 // bez pkt)</small></label>
                                    <input type="text" name="item[p_points]" id="item[p_points]" class="input form-control" value="{$page.p_points}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[p_term]" class="text-info">Czas pobytu: <small>(np. 4 // bez dni)</small></label>
                                    <input type="text" name="item[p_term]" id="item[p_term]" class="input form-control" value="{$page.p_term}">
                                </div>

                                <div class="form-group">
                                    <label for="item[p_occasional]" class="text-info">Okolicznościowy:</label>
                                    <input type="checkbox" name="item[p_occasional]" {if $page.p_occasional}checked="checked"{/if} id="item[p_occasional]" class="switch mid-margin-right" value="1">
                                </div>

                                <div class="form-group">
                                    <label for="item[p_week]" class="text-info">Oferta tygodnia:</label>
                                    <input type="checkbox" name="item[p_week]" {if $page.p_week}checked="checked"{/if} id="item[p_week]" class="switch mid-margin-right" value="1">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[region]" class="text-info">Hotel:</label>
                                    <div class="clear-both"></div>
                                    <select name="item[p_hotels]" class="select check-list">
                                        <option value="0" {if $page.p_hotels == "0"}selected{/if}>Brak wybranego</option>
						              {foreach from=$hotels item=item name=tags}
                                      <option value="{$item.id}" {if $page.p_hotels == $item.id}selected{/if}>{$item.name}</option>
									  {/foreach}
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="item[p_active]" class="text-info">{lang line="default_active"}:</label>
                                    <input type="checkbox" name="item[p_active]" {if $page.p_active}checked="checked"{/if} id="item[p_active]" class="switch mid-margin-right" value="1">
                                </div>

                            </div><!-- ./end span6 -->
                        </div>

                        <!-- button action-->
                        <div class="row" style="margin-top:20px;">
                            <div class="col-md-6">
                            </div>
                            <div class="col-md-6 text-right">
                                <a href="#desc" class="button tabChange">
                                    <span class="button-icon anthracite-gradient"><span class="icon-fwd"></span></span>
                                    {lang line="default_next"}
                                </a>
                                <button type="submit" class="button">
                                    <span class="button-icon green-gradient"><span class="icon-tick"></span></span>
                                    {lang line="default_save"}
                                </button>
                            </div>
                        </div>
                    </div> <!-- #/end data -->
                    <div class="tab-pane fade" id="desc">

                        <div class="row">
                            <div class="col-md-12">
                                <label for="item[p_description]" class="text-info">{lang line="default_description"}:</label>
                                <textarea name="item[p_description]" id="item[p_description]" class="ckeditor">{$page.p_description}</textarea>
                            </div>
                        </div>

                        <!-- button action-->
                        <div class="row" style="margin-top:20px;">
                            <div class="col-md-6">
                                <a href="#data" class="button tabChange">
                                    <span class="button-icon anthracite-gradient"><span class="icon-reply"></span></span>
                                    {lang line="default_back"}
                                </a>
                            </div>
                            <div class="col-md-6 text-right">
                                <button type="submit" class="button">
                                    <span class="button-icon green-gradient"><span class="icon-tick"></span></span>
                                    {lang line="default_save"}
                                </button>
                            </div>
                        </div>

                    </div> <!-- #/end data -->
                </form>
                    <div class="tab-pane fade" id="foto">

                        <div class="row">
                            <div class="col-md-12">
			                    <form action="{$base_url}pakiety/uploadFoto/{$page.p_id}" method="post" enctype="multipart/form-data">
                            		<div class="row">
                                    	<div class="col-md-3">
										    <label for="file" style="display:block;">Zdjęcie:</label>
                                    		<div class="fileinput fileinput-new form-group" data-provides="fileinput">
											  <span class="btn btn-default btn-file"><span class="fileinput-new">Wybierz zdjęcie</span><span class="fileinput-exists">Zmień</span><input type="file" id="file" name="foto"></span>
											  <span class="fileinput-filename"></span>
											</div>
                                    	</div>
                                    	<div class="col-md-3 form-group">
										    <label for="alt">Alt:</label>
										    <input type="text" class="form-control" id="alt" name="alt" placeholder="alt zdjęcia">
                                    	</div>
                                    	<div class="col-md-3 form-group">
			                                <label for="title">Title:</label>
			                                <input type="text" class="form-control" placeholder="tytul zdjęcia" id="title" name="title">
                                    	</div>
                                    	<div class="col-md-3 form-group">
										    <label for="submitFoto" style="display:block;">&nbsp;</label>
			                            	<input id="submitFoto" type="submit" class="btn btn-default" name="uploadFoto" value="Dodaj">
                                    	</div>
                            		</div>
			                        <input type="hidden" name="id" value="{$page.p_id}">
			                    </form>
			                    <hr>
			                    <form action="{$base_url}pakiety/serverFoto/{$page.p_id}" method="post">
			                    <input type="hidden" name="id" value="{$page.p_id}" />
			                    	<h4>Wybierz z dostępnych na serwerze</h4>
			                    	<div class="row">
                                    	<div class="col-md-5" id="files"></div>
                                    	<div class="col-md-7" id="fileTree" style="height: 500px; overflow: auto;"></div>
			                    	</div>
				                    <input class="btn btn-default" type="submit" name="uploadServer" value="Dodaj">
			                    </form><br /><br />
			                    <form action="{$base_url}pakiety/sorts/{$page.p_id}" method="post">
			                        <table class="table">
			                            <thead>
			                                <tr>
			                                    <th>Zdjęcie</th>
			                                    <th>Kolejność</th>
			                                    <th>Title</th>
			                                    <th>Alt</th>
			                                    <th>Akcje</th>
			                                </tr>
			                            </thead>
			                            <tbody>
			                            {foreach from=$photos item=foto name=photos}
			                                    <tr>
			                                        <td class="picture" style="width:140px;">
			                                            <a href="{$uploads}images/pakiety/thumb_200/{$foto.pp_photo}.{$foto.pp_ext}" class="zoombox">
			                                                <img src="{$uploads}images/pakiety/thumb_70/{$foto.pp_photo}.{$foto.pp_ext}" alt="" />
			                                            </a>
			                                        </td>
			                                        <td class="col-md-3">
			                                            <input type="hidden" name="photoId[]" value="{$foto.pp_id}">
			                                            <div class="input-group col-md-6">
			                                            {if $smarty.foreach.photos.first}
			                                            {else}
			                                                <span class="input-group-addon"><button type="submit" name="submit_moveup_{$foto.pp_id}" style="border: none; background: none;" value="">
			                                                    <i class="fa fa-chevron-up"></i>
			                                                </button></span>
			                                            {/if}
			                                            <input type="text" name="position[]" class="form-control" value="{$foto.pp_sort}" size="2"/>
			                                            {if $smarty.foreach.photos.last}
			                                            {else}
			                                                <span class="input-group-addon"><button type="submit" name="submit_movedown_{$foto.pp_id}" style="border: none; background: none;" value="">
			                                                    <i class="fa fa-chevron-down"></i>
			                                                </button></span>
			                                            {/if}
														</div>
													</td>
			                                        <td>{$foto.pp_title}</td>
			                                        <td>{$foto.pp_alt}</td>
			                                        <td class="actions">
			                                            <a href="{$base_url}pakiety/photoDel/{$foto.pp_id}/{$page.p_id}.html" title="Usuń">
			                                                <i class="fa fa-trash-o"></i>
			                                            </a>
			                                        </td>
			                                    </tr>
			                            {/foreach}
			                            </tbody>
			                        </table>
			                        <div class="submit" style="text-align: center;">
			                        	<input class="btn btn-default" name="submit_moveall_0" type="submit" value="Zapisz kolejność" />
			                        </div>
			                        </form>
                            </div>
                        </div>

                        <!-- button action-->
                        <div class="row" style="margin-top:20px;">
                            <div class="col-md-6">
                                <a href="#data" class="button tabChange">
                                    <span class="button-icon anthracite-gradient"><span class="icon-reply"></span></span>
                                    {lang line="default_back"}
                                </a>
                            </div>
                            <div class="col-md-6 text-right">
                                <button type="submit" class="button">
                                    <span class="button-icon green-gradient"><span class="icon-tick"></span></span>
                                    {lang line="default_save"}
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- tab -->