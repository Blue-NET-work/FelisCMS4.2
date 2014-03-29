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
                    <div class="tab-pane fade" id="foto">

                        <div class="row">
                            <div class="col-md-12">
                            	Dodawanie zdjęć
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
                </form>