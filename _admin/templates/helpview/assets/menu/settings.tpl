
<li class="with-right-arrow">
    <span {if $uri[1]=="settings"}class="current"{/if}><i class="menu1-settings"></i> {lang line="default_sidebar_menu_settings"}</span>
    <ul class="big-menu">
        <li><a href="{$base_url}settings.html" {if $uri[1]=="settings" AND $uri[2]==""}class="current navigable-current"{/if}><i class="menu1-earth"></i> {lang line="default_sidebar_menu_settings_general"}</a></li>
        <li><a href="{$base_url}settings/construction.html" {if $uri[1]=="settings" AND $uri[2]=="construction"}class="current navigable-current"{/if}><i class="menu1-support"></i> {lang line="default_sidebar_menu_settings_construction"}</a></li>
        <li><a href="{$base_url}settings/display.html" {if $uri[1]=="settings" AND $uri[2]=="display"}class="current navigable-current"{/if}><i class="menu1-slideshow"></i> {lang line="default_sidebar_menu_settings_display"}</a></li>
        <li><a href="{$base_url}settings/smtp.html" {if $uri[1]=="settings" AND $uri[2]=="smtp"}class="current navigable-current"{/if}><i class="menu1-mail"></i> {lang line="default_sidebar_menu_settings_smtp"}</a></li>
        <li><a href="{$base_url}settings/owner.html" {if $uri[1]=="settings" AND $uri[2]=="owner"}class="current navigable-current"{/if}><i class="menu1-vcard"></i> {lang line="default_sidebar_menu_settings_owner"}</a></li>
    </ul>
</li>