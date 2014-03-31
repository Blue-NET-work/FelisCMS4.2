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

                                <div class="form-group block-label">
                                    <label for="item[tags]" class="text-info">Na terenie obiektu: <small>(frazy rozdzielić "," np. internet, telewizja, parking)</small></label>
                                    <input type="text" name="item[tags]" id="item[tags]" class="input form-control" value="{$page.tags}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[rooms]" class="text-info">Pokoi: <small>(tylko liczba)</small></label>
                                    <input type="text" name="item[rooms]" id="item[rooms]" class="input form-control" value="{$page.rooms}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[stars]" class="text-info">Gwiazdek: <small>(tylko liczba)</small></label>
                                    <input type="text" name="item[stars]" id="item[stars]" class="input form-control" value="{$page.stars}">
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[province]" class="text-info">Województwo:</label>
                                    <div class="clear-both"></div>
                                    <select name="item[province]" class="select check-list">
                                        <option value="dolnośląskie" {if $page.province == "dolnośląskie"}selected{/if}>dolnośląskie</option>
                                        <option value="kujawsko-pomorskie" {if $page.province == "kujawsko-pomorskie"}selected{/if}>kujawsko-pomorskie</option>
                                        <option value="lubelskie" {if $page.province == "lubelskie"}selected{/if}>lubelskie</option>
                                        <option value="lubuskie" {if $page.province == "lubuskie"}selected{/if}>lubuskie</option>
                                        <option value="łódzkie" {if $page.province == "łódzkie"}selected{/if}>łódzkie</option>
                                        <option value="małopolskie" {if $page.province == "małopolskie"}selected{/if}>małopolskie</option>
                                        <option value="mazowieckie" {if $page.province == "mazowieckie"}selected{/if}>mazowieckie</option>
                                        <option value="opolskie" {if $page.province == "opolskie"}selected{/if}>opolskie</option>
                                        <option value="podkarpackie" {if $page.province == "podkarpackie"}selected{/if}>podkarpackie</option>
                                        <option value="podlaskie" {if $page.province == "podlaskie"}selected{/if}>podlaskie</option>
                                        <option value="pomorskie" {if $page.province == "pomorskie"}selected{/if}>pomorskie</option>
                                        <option value="śląskie" {if $page.province == "śląskie"}selected{/if}>śląskie</option>
                                        <option value="świętokrzyskie" {if $page.province == "świętokrzyskie"}selected{/if}>świętokrzyskie</option>
                                        <option value="warmińsko-mazurskie" {if $page.province == "warmińsko-mazurskie"}selected{/if}>warmińsko-mazurskie</option>
                                        <option value="wielkopolskie" {if $page.province == "wielkopolskie"}selected{/if}>wielkopolskie</option>
                                        <option value="zachodniopomorskie" {if $page.province == "zachodniopomorskie"}selected{/if}>zachodniopomorskie</option>
                                    </select>
                                </div>

                                <div class="form-group block-label">
	                                <div class="row">
                                		<div class="col-md-6">
		                                    <label for="item[city]" class="text-info">Miasto:</label>
		                                    <div class="clear-both"></div>
		                                    <select name="item[city]" id="city" class="select check-list">
		                                    	<option value="0" selected="selected">Dodaj nowe</option>
		                                    {foreach from=$city item=item name=pages}
		                                        <option value="{$item.id}" {if $page.city == $item.id}selected{/if}>{$item.name}</option>
		                                    {/foreach}
		                                    </select>
                                		</div>
                                		<div class="col-md-6">
		                                    <label for="item[parent_id]" class="text-info">Nowe miasto: <small>(jeśli chcesz zdefiniować nowe)</small></label>
		                                    <input type="text" class="input form-control" name="city_new">
		                                </div>
	                                </div>
                                </div>

                                <div class="form-group block-label">
                                    <label for="item[region]" class="text-info">Region:</label>
                                    <div class="clear-both"></div>
                                    <select name="item[region]" class="select check-list">
                                        <option value="0" {if $page.region == "0"}selected{/if}>Brak wybranego</option>
                                        <option value="2" {if $page.region == "2"}selected{/if}>Północ</option>
                                        <option value="3" {if $page.region == "3"}selected{/if}>Południe</option>
                                        <option value="4" {if $page.region == "4"}selected{/if}>Wschód</option>
                                        <option value="5" {if $page.region == "5"}selected{/if}>Zachód</option>
                                        <option value="6" {if $page.region == "6"}selected{/if}>Centrum</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="item[active]" class="text-info">{lang line="default_active"}:</label>
                                    <input type="checkbox" name="item[active]" {if $page.active}checked="checked"{/if} id="item[active]" class="switch mid-margin-right" value="1">
                                </div>

                                <div class="form-group">
                                    <label for="item[recommended]" class="text-info">Polecany:</label>
                                    <input type="checkbox" name="item[recommended]" {if $page.recommended}checked="checked"{/if} id="item[recommended]" class="switch mid-margin-right" value="1">
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
                    <div class="tab-pane fade" id="foto">

                        <div class="row">
                            <div class="col-md-12">
			                    <form action="{$base_url}hotels/uploadFoto/{$page.id}" method="post" enctype="multipart/form-data">
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
			                    <form action="{$base_url}hotels/serverFoto/{$page.id}" method="post">
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
			                    <form action="{$base_url}hotels/sorts/{$page.id}" method="post">
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
			                                            <a href="{$uploads}images/hotels/thumb_200/{$foto.hp_photo}.{$foto.hp_ext}" class="zoombox">
			                                                <img src="{$uploads}images/hotels/thumb_70/{$foto.hp_photo}.{$foto.hp_ext}" alt="" />
			                                            </a>
			                                        </td>
			                                        <td class="col-md-3">
			                                            <input type="hidden" name="photoId[]" value="{$foto.hp_id}">
			                                            <div class="input-group col-md-6">
			                                            {if $smarty.foreach.photos.first}
			                                            {else}
			                                                <span class="input-group-addon"><button type="submit" name="submit_moveup_{$foto.hp_id}" style="border: none; background: none;" value="">
			                                                    <i class="fa fa-chevron-up"></i>
			                                                </button></span>
			                                            {/if}
			                                            <input type="text" name="position[]" class="form-control" value="{$foto.hp_sort}" size="2"/>
			                                            {if $smarty.foreach.photos.last}
			                                            {else}
			                                                <span class="input-group-addon"><button type="submit" name="submit_movedown_{$foto.hp_id}" style="border: none; background: none;" value="">
			                                                    <i class="fa fa-chevron-down"></i>
			                                                </button></span>
			                                            {/if}
														</div>
													</td>
			                                        <td>{$foto.hp_title}</td>
			                                        <td>{$foto.hp_alt}</td>
			                                        <td class="actions">
			                                            <a href="{$base_url}hotels/photoDel/{$foto.hp_id}/{$page.id}.html" title="Usuń">
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