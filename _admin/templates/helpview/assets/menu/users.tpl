
<li class="with-right-arrow">
    <span {if $uri[1]=="users"}class="current"{/if}><i class="menu1-users"></i> {lang line="default_sidebar_menu_users"}</span>
    <ul class="big-menu">
        <li><a href="{$base_url}users.html" {if $uri[1]=="users" AND $uri[2]==""}class="current navigable-current"{/if}><i class="menu1-list"></i> {lang line="default_sidebar_menu_users_list"}</a></li>
        <li><a href="{$base_url}users/add.html" {if $uri[1]=="users" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="menu1-pen"></i> {lang line="default_sidebar_menu_users_add"}</a></li>
        <li><a href="{$base_url}users/permissions.html" {if $uri[1]=="users" AND $uri[2]=="permissions"}class="current navigable-current"{/if}><i class="menu1-key"></i> {lang line="default_sidebar_menu_users_permissions"}</a></li>
        <li><a href="{$base_url}users/groups.html" {if $uri[1]=="users" AND $uri[2]=="groups"}class="current navigable-current"{/if}><i class="menu1-users"></i> {lang line="default_sidebar_menu_users_groups"}</a></li>
        <li><a href="{$base_url}users/you.html" {if $uri[1]=="users" AND $uri[2]=="you"}class="current navigable-current"{/if}><i class="menu1-user"></i> {lang line="default_sidebar_menu_users_you"}</a></li>
    </ul>
</li>