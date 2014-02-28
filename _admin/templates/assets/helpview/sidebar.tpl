 
    <!-- Button to open/hide menu -->
    <a href="#" id="open-menu"><span>{lang line="default_sidebar_menu"}</span></a>
 
    <!-- Sidebar/drop-down menu -->
    <section id="menu" role="complementary">                         
        <div id="menu-content">
        
{include file="./sidebar/access.tpl"} 
{include file="./sidebar/profile.tpl"}  

        <!-- Menu
        ================================================== -->
        <section class="navigable">
            <ul class="big-menu">                                                                                          
                <li><a href="{$base_url}" {if $uri[1]=="" || $uri[1]=="dashboard" AND $uri[2]==""}class="current"{/if}><i class="menu1-home"></i> {lang line="default_sidebar_menu_home"}</a></li>   
                <!-- Menu
                ================================================== -->
                <li><a href="{$base_url}menu.html" {if $uri[1]=="menu"}class="current"{/if}><i class="menu1-directions"></i> {lang line="default_sidebar_menu_menu"}</a></li>
            {if $adminMenu.pages == "1"}
                <!-- Pages
                ================================================== -->
                {include file="./assets/menu/pages.tpl"} 
            {/if}
            {if $adminMenu.articles == "1"}
                <!-- Articles                           
                ================================================== -->
                {include file="./assets/menu/articles.tpl"} 
            {/if}
            {if $adminMenu.galleries == "1"}
                <!-- Galleries                           
                ================================================== -->
                {include file="./assets/menu/galleries.tpl"} 
            {/if}
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
            {if $adminMenu.users == "1"}
                <!-- Users                             
                ================================================== -->
                {include file="./assets/menu/users.tpl"}
            {/if} 
                    <li class="with-right-arrow">
                        <a href="{$TEMPLATES}ajax/submenu.html" class="navigable-ajax" title="Menu title">With ajax sub-menu</a>
                    </li>
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
            <div class="footer black white">&copy; 2009 - {$smarty.now|date_format:"%Y"} FelisCMS by Blue-NET.pl</div>            
            <div class="footer white">{lang line="felis_software"}: FelisCMS ver.{$ver}</div>
        </footer>    

    </section>
    <!-- End sidebar/drop-down menu -->