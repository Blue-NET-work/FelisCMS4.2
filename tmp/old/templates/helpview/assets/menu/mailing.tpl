
<li class="with-right-arrow">
    <span {if $uri[1]=="mailing"}class="current"{/if}><i class="menu1-mail"></i> {lang line="default_sidebar_menu_mailing"}</span>
    <ul class="big-menu">
        <li><a href="{$base_url}mailing.html" {if $uri[1]=="mailing" AND $uri[2]==""}class="current navigable-current"{/if}><i class="menu1-idea"></i> {lang line="default_sidebar_menu_mailing_list"}</a></li>
        <li><a href="{$base_url}mailing/add.html" {if $uri[1]=="mailing" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="menu1-timer"></i> {lang line="default_sidebar_menu_mailing_add"}</a></li>
        <li><a href="{$base_url}mailing/newsletter.html" {if $uri[1]=="mailing" AND $uri[2]=="newsletter"}class="current navigable-current"{/if}><i class="menu1-layout"></i> {lang line="default_sidebar_menu_mailing_newsletter"}</a></li>
        <li><a href="{$base_url}mailing/newsletter_add.html" {if $uri[1]=="mailing" AND $uri[2]=="newsletter_add"}class="current navigable-current"{/if}><i class="menu1-medias"></i> {lang line="default_sidebar_menu_mailing_newsletter_add"}</a></li>
    </ul>
</li>