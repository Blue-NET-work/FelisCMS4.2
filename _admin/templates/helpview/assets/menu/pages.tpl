
<li class="with-right-arrow">
    <span {if $uri[1]=="pages"}class="current"{/if}><i class="menu1-pages"></i> {lang line="default_sidebar_menu_pages"}</span>
    <ul class="big-menu">
        <li><a href="{$base_url}pages.html" {if $uri[1]=="pages" AND $uri[2]==""}class="current navigable-current"{/if}><i class="menu1-list"></i>  {lang line="default_sidebar_menu_pages_list"}</a></li>
        <li><a href="{$base_url}pages/add.html" {if $uri[1]=="pages" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="menu1-pen"></i>  {lang line="default_sidebar_menu_pages_add"}</a></li>
    </ul>
</li>  