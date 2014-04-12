{extends file="assets/helpview/_Layout.tpl"}

<!-- Blok dla head dodatkowego -->
{block name="head"}
{/block}


<!-- Blok dla danych headera -->
{block name="header"}
        <!-- Body Header
        ================================================== -->
        <header>
            <h1 class="title"><i class="fa fa-2x fa-tachometer"></i>  {lang line="dashboard_titleTag"}</h1>
            <ul class="breadcrumb unstyled-list">
              <li><a href="{$base_url}">{lang line="default_control_panel"}</a></li>
              <li><a href="{$base_url}{$uri[1]}">{lang line="default_control_panel"}</a></li>
              <li class="active">{lang line="dashboard_titleTag"}</li>
            </ul>
        </header>
{/block}


<!-- Blok dla zawrtości strony -->
{block name="content"}

            <!-- panel -->
            <div class="panel panel-black" id="panel">
              <div class="panel-heading">
                {lang line="pages_titleTag2"}
                <div class="absolute-right">
                    <ul class="nav nav-tabs" id="navTabs">
                        <li class="active"><a href="#data" data-toggle="tab" class="panel-link">{lang line="default_data"}</a></li>
                        <li><a href="#desc" data-toggle="tab" class="panel-link">{lang line="default_description"}</a></li>
                    </ul>
                    <!-- toggle (show hide) -->
                    <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>
                </div>
              </div>
              <!-- ./end panel-heading -->
              <div id="panel-body" class="panel-body in">
                    {include file="pages/_PageForm.tpl"}
              </div>
            </div>
            <!-- panel -->

{/block}


<!-- Blok dla jQuery dodatkowego -->
{block name="jQuery"}
	<script src="{$base_url}../felis/modules/ckeditor/ckeditor.js"></script>
	<script>
	{include file="assets/js/scripts/felis.function.pages.js"}
	</script>
{/block}