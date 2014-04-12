{extends file="assets/helpview/_Layout.tpl"}

<!-- Blok dla head dodatkowego -->
{block name="head"}
    <link rel="stylesheet" href="{$TEMPLATES}assets/js/libs/DataTables/jquery.dataTables-simple.css">
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

            <div class="panel panel-default panel-black" id="panel">
                <div class="panel-heading">{lang line="pages_titleTag"}
                    <div class="absolute-right">
                        <!-- toggle (show hide) -->
                        <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>
                    </div>
                </div>
                <!-- ./end panel-heading -->
                <div id="panel-body" class="panel-body in">
                    <table class="datatable table table-striped table-hover" id="table">
                      <thead>
                        <tr>
                            <th style="min-width:30px;">ID</th>
                            <th>{lang line="default_name"}</th>
                            <th>{lang line="default_adres"}</th>
                            <th>{lang line="default_category"}</th>
                            {if $service_multilang == 'TRUE'}<th>{lang line="default_sidebar_access_lang"}</th>{/if}
                            <th style="width: 90px; text-align: center;">{lang line="default_action"}</th>
                        </tr>
                      </thead>
                      <tbody>
                        {foreach from=$pages item=item name=pages}
                            <!-- wpis -->
                                <tr>
                                    <td>{$item.id}</td>
                                    <td>{$item.name}</td>
                                    <td nowrap="nowrap"><a href="#" data-href="{$base_url}../{$item.alias}.html" class="preview with-tooltip" title="{lang line="default_sidebar_access_preview"}" data-title="{$item.name}">{$item.alias}.html</a></td>
                                    <td>{if $item.parent_name}{$item.parent_name} <span class="label label-primary">ID {$item.parent_id}</span>{else}{lang line="default_category_no"}{/if}</td>
                                    {if $service_multilang == 'TRUE'}<td>{$item.lang}</td>{/if}
                                    <td class="actions">
                                        <a href="{$base_url}pages/edit/{$item.id}.html" title="{lang line="default_edit"}" class="felisEdit with-tooltip glyphicon glyphicon-pencil"></a>
                                    {if $item.active == 0}
                                        <a  id="status_{$item.id}" title="{lang line="default_active"}" data-item="{$item.id}" href="#" class="felisAccept glyphicon glyphicon-ok with-tooltip"></a>
                                    {else}
                                        <a id="status_{$item.id}" title="{lang line="default_block"}" data-item="{$item.id}" href="#" class="felisBlock glyphicon glyphicon-ban-circle with-tooltip"></a>
                                    {/if}
                                        <a href="#" data-item="{$item.id}" title="{lang line="default_delete"}" class="felisDel glyphicon glyphicon-trash with-tooltip confirm"></a>
                                    </td>
                                </tr>
                            <!-- koniec wpisu -->
                        {/foreach}
                      </tbody>
                    </table>
                </div>
            </div>

{/block}


<!-- Blok dla jQuery dodatkowego -->
{block name="jQuery"}
	<script>
	{include file="assets/js/scripts/felis.function.pages.js"}
	</script>
{/block}