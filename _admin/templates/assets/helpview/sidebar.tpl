
    <!-- Button to open/hide menu -->
    <a href="#" id="open-menu"><span>{lang line="felis_sidebar_menu"}</span></a>

    <!-- Sidebar/drop-down menu -->
    <section id="menu" role="complementary">
        <div id="menu-content">

{include file="./sidebar/access.tpl"}
{include file="./sidebar/profile.tpl"}

        <!-- Menu
        ================================================== -->
        <section class="navigable">
            <ul class="big-menu">
                <li><a href="{$base_url}" {if $uri[1]=="" || $uri[1]=="dashboard" AND $uri[2]==""}class="current"{/if}><i class="fa fa-home"></i>{lang line="default_sidebar_menu_home"}</a></li>
                {*
                <!-- Menu
                ================================================== -->
                <li><a href="{$base_url}menu.html" {if $uri[1]=="menu"}class="current"{/if}><i class="fa fa-bars"></i>{lang line="default_sidebar_menu_menu"}</a></li>
                *}
                <!-- Pages -->
                {include file="./sidebar/menu_pages.tpl"}
                <!-- Articles -->
                {include file="./sidebar/menu_articles.tpl"}
                <!-- Galleries -->
                {include file="./sidebar/menu_galleries.tpl"}

            {if $adminMenu.statistic == "1"}
                <!-- Statistic
                ================================================== -->
                {include file="./assets/menu/statistic.tpl"}
            {/if}
            {if $adminMenu.calendar == "1"}
                <!-- Calendar
                ================================================== -->
                {include file="./assets/menu/calendar.tpl"}
            {/if}
            {if $adminMenu.mailing == "1"}
                <!-- Mailing
                ================================================== -->
                {include file="./assets/menu/mailing.tpl"}
            {/if}
            {if $adminMenu.shop == "1"}
                <!-- Shop
                ================================================== -->
                {include file="./assets/menu/shop.tpl"}
            {/if}
            {if $adminMenu.layout == "1"}
                <!-- Layout
                ================================================== -->
                {include file="./assets/menu/layout.tpl"}
            {/if}
            {if $adminMenu.settings == "1"}
                <!-- Layout
                ================================================== -->
                {include file="./assets/menu/settings.tpl"}
            {/if}
                <!-- Users -->
                {include file="./sidebar/menu_users.tpl"}
            </ul>
        </section>

{include file="./sidebar/events_messages.tpl"}

        </div>
        <!-- #end menu-content  -->

        <!-- footer
        ================================================== -->
        <footer>
            <div class="footer white">
                <p class="button-height" style="margin:5px 0 0px; line-height:25px;">
                    <input checked="checked" type="checkbox" name="auto-refresh" id="auto-refresh" class="switch medium float-right">
                    <label for="auto-refresh">{lang line="felis_sidebar_auto_refresh"}</label>
                </p>
            </div>
            <div class="footer black white">&copy; 2009 - {$smarty.now|date_format:"%Y"} F2CMS</div>
            <div class="footer white">{lang line="felis_software"}: F2CMS ver.{$ver}</div>
        </footer>

    </section>
    <!-- End sidebar/drop-down menu -->