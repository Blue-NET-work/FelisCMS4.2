
    
    <section id="menu" role="complementary">
    <div id="menu-content">
                                                
{include file="./assets/sidebar/access.tpl"} 
{include file="./assets/sidebar/profile.tpl"} 

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
                {include file="./sidebar/menu/pages.tpl"} 
            {/if}
            {if $adminMenu.articles == "1"}
                <!-- Articles                           
                ================================================== -->
                {include file="./sidebar/menu/articles.tpl"} 
            {/if}
            {if $adminMenu.galleries == "1"}
                <!-- Galleries                           
                ================================================== -->
                {include file="./sidebar/menu/galleries.tpl"} 
            {/if}
            {if $adminMenu.statistic == "1"}
                <!-- Statistic                          
                ================================================== -->
                {include file="./sidebar/menu/statistic.tpl"} 
            {/if}
            {if $adminMenu.calendar == "1"}
                <!-- Calendar                          
                ================================================== -->
                {include file="./sidebar/menu/calendar.tpl"} 
            {/if}
            {if $adminMenu.mailing == "1"}
                <!-- Mailing                            
                ================================================== -->
                {include file="./sidebar/menu/mailing.tpl"}
            {/if} 
            {if $adminMenu.shop == "1"}
                <!-- Shop                              
                ================================================== -->
                {include file="./sidebar/menu/shop.tpl"}
            {/if} 
            {if $adminMenu.layout == "1"}
                <!-- Layout                           
                ================================================== -->
                {include file="./sidebar/menu/layout.tpl"} 
            {/if}
            {if $adminMenu.settings == "1"}
                <!-- Layout                           
                ================================================== -->
                {include file="./sidebar/menu/settings.tpl"}  
            {/if}
            {if $adminMenu.users == "1"}
                <!-- Users                             
                ================================================== -->
                {include file="./sidebar/menu/users.tpl"}
            {/if} 
            </ul>     
        </section>       
        
{include file="./assets/sidebar/events_messages.tpl"} 
        
    </div>
    <!-- #end menu-content  --> 

    <!-- footer
    ================================================== -->
    <footer>
        <div class="footer white">
            <p class="button-height" style="margin:1px 0 0px; line-height:20px;"> 
                <input checked="checked" type="checkbox" name="auto-refresh" id="auto-refresh" class="switch medium float-right">
                <label for="auto-refresh">{lang line="default_sidebar_auto_refresh"}</label>
            </p>
        </div>
        <div class="footer black white">
            &copy; 2009 - {$smarty.now|date_format:"%Y"} FelisCMS by Blue-NET.pl
        </div>            
        <div class="footer white">
            Oprogramowanie: FelisCMS ver.{$ver}
        </div>
    </footer>

    </section>