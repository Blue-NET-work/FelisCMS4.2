
    <li class="with-right-arrow">
        <span {if $uri[1]=="articles"}class="current"{/if}><i class="fa fa-th-list"></i>{lang line="default_sidebar_menu_articles"} <span class="list-count">11</span></span>
        <ul class="big-menu">
            <li><a href="{$base_url}articles.html" {if $uri[1]=="articles" AND $uri[2]==""}class="current navigable-current"{/if}><i class="fa fa-list"></i>{lang line="default_sidebar_menu_articles_list"}</a></li>
            <li><a href="{$base_url}articles/add.html" {if $uri[1]=="articles" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="fa fa-plus"></i>{lang line="default_sidebar_menu_articles_add"}</a></li>
            {*<li><a href="{$base_url}articles/comments.html" {if $uri[1]=="articles" AND $uri[2]=="comments"}class="current navigable-current"{/if}><i class="fa fa-comments"></i>{lang line="default_sidebar_menu_articles_comments"} <span class="list-count">11</span></a></li>
            <li class="with-right-arrow">
                <span {if $uri[1]=="articles" AND $uri[2]=="category" || $uri[1]=="articles" AND $uri[2]=="category_add" || $uri[1]=="articles" AND $uri[2]=="category_edit"}class="current"{/if}><i class="fa fa-files-o"></i>{lang line="default_sidebar_menu_articles_category"}</span>
                <ul class="big-menu">
                    <li><a href="{$base_url}articles/category.html" {if $uri[1]=="articles" AND $uri[2]=="category"}class="current navigable-current"{/if}><i class="fa fa-list"></i>{lang line="default_sidebar_menu_articles_category_list"}</a></li>
                    <li><a href="{$base_url}articles/category_add.html" {if $uri[1]=="articles" AND $uri[2]=="category_add"}class="current navigable-current"{/if} href="#"><i class="fa fa-plus"></i>{lang line="default_sidebar_menu_articles_category_add"}</a></li>
                </ul>
            </li>*}
        </ul>
    </li>