
<li class="with-right-arrow">
    <span {if $uri[1]=="layout"}class="current"{/if}><i class="menu1-layout"></i> {lang line="default_sidebar_menu_layout"}</span>
    <ul class="big-menu">
        <li><a href="{$base_url}layout/components.html" {if $uri[1]=="layout" AND $uri[2]=="components"}class="current navigable-current"{/if}><i class="menu1-idea"></i> {lang line="default_sidebar_menu_layout_components"}</a></li>
        <li><a href="{$base_url}layout/templates.html" {if $uri[1]=="layout" AND $uri[2]=="templates"}class="current navigable-current"{/if}><i class="menu1-layout"></i> {lang line="default_sidebar_menu_layout_templates"}</a></li>
        <li><a href="{$base_url}layout/widgets.html" {if $uri[1]=="layout" AND $uri[2]=="widgets"}class="current navigable-current"{/if}><i class="menu1-slideshow"></i> {lang line="default_sidebar_menu_layout_widgets"}</a></li>
        <li><a href="{$base_url}layout/editor.html" {if $uri[1]=="layout" AND $uri[2]=="editor"}class="current navigable-current"{/if}><i class="menu1-clipboard"></i> {lang line="default_sidebar_menu_layout_editor"}</a></li>
        <li><a href="{$base_url}layout/menage_files.html"><i class="menu1-medias"></i> {lang line="default_sidebar_menu_layout_menage_files"}</a></li>
        <li><a href="{$base_url}layout/cache_del.html" {if $uri[1]=="layout" AND $uri[2]=="cache_del"}class="current navigable-current"{/if}><i class="menu1-timer"></i> {lang line="default_sidebar_menu_layout_cache_file"}</a></li>
    </ul>
</li>