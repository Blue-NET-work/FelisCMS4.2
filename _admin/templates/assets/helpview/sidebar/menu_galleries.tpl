
<li class="with-right-arrow">
    <span {if $uri[1]=="gallery"}class="current"{/if}><i class="fa fa-picture-o"></i>{lang line="default_sidebar_menu_galleries"}</span>
    <ul class="big-menu">
        <li><a href="{$base_url}gallery.html" {if $uri[1]=="gallery" AND $uri[2]==""}class="current navigable-current"{/if}><i class="fa fa-list"></i>{lang line="default_sidebar_menu_galleries_list"}</a></li>
        <li><a href="{$base_url}gallery/add.html" {if $uri[1]=="gallery" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="fa fa-plus"></i>{lang line="default_sidebar_menu_galleries_add"}</a></li>
        <li class="with-right-arrow">
            <span {if $uri[1]=="gallery" AND $uri[2]=="category" || $uri[1]=="gallery" AND $uri[2]=="category_add" || $uri[1]=="gallery" AND $uri[2]=="category_edit"}class="current"{/if}><i class="fa fa-files-o"></i>{lang line="default_sidebar_menu_galleries_category"}</span>
            <ul class="big-menu">
                <li><a href="{$base_url}gallery/category.html" {if $uri[1]=="gallery" AND $uri[2]=="category"}class="current navigable-current"{/if}><i class="fa fa-list"></i>{lang line="default_sidebar_menu_galleries_category_list"}</a></li>
                <li><a href="{$base_url}gallery/category_add.html" {if $uri[1]=="gallery" AND $uri[2]=="category_add"}class="current navigable-current"{/if}><i class="fa fa-plus"></i>{lang line="default_sidebar_menu_galleries_category_add"}</a></li>
            </ul>
        </li>
    </ul>
</li> 