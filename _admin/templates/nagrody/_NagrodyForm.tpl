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
                                    <label for="item[name]" class="text-info">{lang line="default_name"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[name]" id="item[name]" class="input form-control FelisNazwa" value="{$page.name}">
                                </div>

                                <div class="form-group has-feedback block-label">
                                    <label for="item[alias]" class="text-info">{lang line="default_show_adres"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                    <input type="text" name="item[alias]" id="item[alias]" class="input form-control FelisAlias" value="{$page.alias}">
  									<span id="FelisAlias" class="fa fa-spinner fa-spin form-control-feedback"></span>
                                </div>
                                <div class="form-group">
                                    <label for="item[active]" class="text-info">{lang line="default_active"}:</label>
                                    <input type="checkbox" name="item[active]" {if $page.active}checked="checked"{/if} id="item[active]" class="switch mid-margin-right" value="1">
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
                                <label for="item[description]" class="text-info">{lang line="default_description"}:</label>
                                <textarea name="item[description]" id="item[description]" class="ckeditor">{$page.description}</textarea>
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
                    <div class="tab-pane fade" id="atrib">
                        <div class="row">
                            <div class="col-md-12">
			                    <form action="{$base_url}nagrody/atrybutAdd/{$page.id}" method="post" enctype="multipart/form-data">
			                    	<div class="row">
                                    	<div class="col-md-4">
										    <label for="file" style="display:block;">Kwota w punktach:</label>
										    <input type="text" class="form-control" id="alt" name="item[npe_point]" placeholder="Kwota w punktach">
                                    	</div>
                                    	<div class="col-md-4">
										    <label for="file" style="display:block;">Kwota w złotych:</label>
										    <input type="text" class="form-control" id="alt" name="item[npe_price]" placeholder="Kwota w złotych">
                                    	</div>
                                    	<div class="col-md-4 form-group">
										    <label for="submitFoto" style="display:block;">&nbsp;</label>
			                            	<input id="submitFoto" type="submit" class="btn btn-default" name="atrybutAdd" value="Dodaj">
                                    	</div>
			                    	</div>
			                    </form>
			                    <h4>Atrybuty cenowe</h4>
			                    <table class="table">
			                        <thead>
			                            <tr>
			                                <th>Cena w punktach</th>
			                                <th>Cena w złotych</th>
			                                <th>Akcje</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                        {foreach from=$prices item=price name=prices}
			                                <tr>
			                                    <td>{$price.npe_point}</td>
			                                    <td>{$price.npe_price}</td>
			                                    <td class="actions">
			                                        <a href="{$base_url}nagrody/photoDel/{$price.npe_id}/{$page.id}.html" title="Usuń">
			                                            <i class="fa fa-trash-o"></i>
			                                        </a>
			                                    </td>
			                                </tr>
			                        {/foreach}
			                        </tbody>
			                    </table>
			                </div>
			            </div>
                    </div>

                    <div class="tab-pane fade" id="foto">

                        <div class="row">
                            <div class="col-md-12">
			                    <form action="{$base_url}nagrody/uploadFoto/{$page.id}" method="post" enctype="multipart/form-data">
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
			                        <input type="hidden" name="id" value="{$page.id}">
			                    </form>
			                    <hr>
			                    <form action="{$base_url}nagrody/serverFoto/{$page.id}" method="post">
			                    <input type="hidden" name="id" value="{$page.id}" />
			                    	<h4>Wybierz z dostępnych na serwerze</h4>
				                    <table class="table nocss">
				                        <tbody>
				                        <tr>
				                            <td id="files" width="30%" style="vertical-align: top;"></td>
				                            <td valign="top"><div id="fileTree" style="width: 700px; height: 500px; overflow: auto;"></div></td>
				                        </tr>
				                        </tbody>
				                    </table>
				                    <input class="btn btn-default" type="submit" name="uploadServer" value="Dodaj">
			                    </form><br /><br />
			                    <form action="{$base_url}nagrody/sorts/{$page.id}" method="post">
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
			                                            <a href="{$uploads}images/nagrody/thumb_200/{$foto.np_photo}.{$foto.np_ext}" class="zoombox">
			                                                <img src="{$uploads}images/nagrody/thumb_70/{$foto.np_photo}.{$foto.np_ext}" alt="" />
			                                            </a>
			                                        </td>
			                                        <td class="col-md-3">
			                                            <input type="hidden" name="photoId[]" value="{$foto.np_id}">
			                                            <div class="input-group col-md-6">
			                                            {if $smarty.foreach.photos.first}
			                                            {else}
			                                                <span class="input-group-addon"><button type="submit" name="submit_moveup_{$foto.np_id}" style="border: none; background: none;" value="">
			                                                    <i class="fa fa-chevron-up"></i>
			                                                </button></span>
			                                            {/if}
			                                            <input type="text" name="position[]" class="form-control" value="{$foto.np_sort}" size="2"/>
			                                            {if $smarty.foreach.photos.last}
			                                            {else}
			                                                <span class="input-group-addon"><button type="submit" name="submit_movedown_{$foto.np_id}" style="border: none; background: none;" value="">
			                                                    <i class="fa fa-chevron-down"></i>
			                                                </button></span>
			                                            {/if}
														</div>
													</td>
			                                        <td>{$foto.np_title}</td>
			                                        <td>{$foto.np_alt}</td>
			                                        <td class="actions">
			                                            <a href="{$base_url}nagrody/photoDel/{$foto.np_id}/{$page.id}.html" title="Usuń">
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