    <!-- Button to open/hide menu -->
    <a href="#" id="open-menu"><span>{lang line="default_sidebar_menu"}</span></a>
    
    <section id="menu" role="complementary">
    <div id="menu-content">

        <!-- Logo
        ================================================== -->
        <header id="logo">
            <a href="http://blue-net.pl"><img src="{$base_url}public/img/logo.png" alt=""></a>
        </header>

        <!-- Access
        ================================================== -->
        <ul id="access">
            <li><a href="#" class="icon1-calendar with-tooltip" title="{lang line="default_sidebar_access_calendar"}"></a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle with-tooltip" role="button" data-toggle="dropdown" data-hover="dropdown" title="{lang line="default_sidebar_access_lang"}"><span class="icon1-flag"></span><b class="caret"></b></a>
                <ul class="dropdown-menu dropdown-menu-arrow" role="menu" aria-labelledby="drop1">
                  <li><a href="{$base_url}dashboard/language/pl.html"><i class="lang-pl"></i> {lang line="default_lang_polish"}</a></li>  
                  <li><a href="{$base_url}dashboard/language/en.html"><i class="lang-us"></i> {lang line="default_lang_english"}</a></li>
                  <li><a href="{$base_url}dashboard/language/de.html"><i class="lang-de"></i> Niemiecki</a></li>
                  <li><a href="{$base_url}dashboard/language/ru.html"><i class="lang-ru"></i> Ruski</a></li>  
                </ul>
            </li>
            <li><a href="{$base_url}messages.html"><span class="icon1-inbox with-tooltip" title="{lang line="default_sidebar_access_messages"}"></span>{if $messages_count}<span class="count">{$messages_count}</span>{/if}</a></li>
            <li><a href="#" data-href="{$base_url}../" class="icon1-monitor with-tooltip preview" title="{lang line="default_sidebar_access_preview"}"></a></li>
            <li><a href="{$base_url}dashboard/logout.html" class="icon1-logout with-tooltip" title="{lang line="default_sidebar_access_logout"}"></a></li>
        </ul>

        <!-- Profile
        ================================================== -->
        <section id="profile">
            <div class="row">
                <div class="col-md-3 thumbnail"><img src="{$userLogIn.avatar}" class="img-rounded" alt="avatar"></div>
                <div class="col-md-9">
                    {lang line="default_sidebar_menu_hello"},
                    <span class="name">{$userLogIn.first_name} <b>{$userLogIn.last_name}</b></span>
                    <span class="profileUprawnienia">{lang line="default_sidebar_menu_permissions"}: {$userLogIn.high}</span>
                </div>
            </div>
        </section>     

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
            </ul>     
        </section>       
                                                               
        {if $newMessages || $eventsToday}
        <!-- Wiadomości i dzisiejsze wydażenia
        ================================================== -->
        <ul class="unstyled-list">
        {if $eventsToday}
            <li class="title-menu">{lang line="default_sidebar_today_event"}</li>
            <li>
                <ul class="calendar-menu">
                    <li>
                        <a href="#" title="See event">
                            <time datetime="2011-02-24"><b>24</b> Feb</time>
                            <small class="green">10:30</small>
                            Event's description
                        </a>
                    </li>     
                </ul>
            </li>
        {/if}
        {if $newMessages}
            <li class="title-menu">{lang line="default_sidebar_new_messages"}</li>
            <li>
                <ul class="message-menu">  
                    <li>
                        <a href="#" title="Read message">
                            <span class="message-status">
                                <span class="unstarred">Not starred</span>
                                <span class="new-message">New</span>
                            </span>
                            <span class="message-info">
                                <span class="blue">15:47</span>
                            </span>
                            <strong class="blue">May Starck</strong><br>
                            <strong>Mail subject a bit longer</strong>
                        </a>
                    </li>    
                </ul>
            </li>
        {/if}
        </ul><!-- ./end Wiadomości i dzisiejsze wydażenia -->
        {/if}
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
            &copy; 2013 - {$smarty.now|date_format:"%Y"} FelisCMS by Blue-NET.pl
        </div>            
        <div class="footer white">
            Oprogramowanie: FelisCMS ver.{$ver}
        </div>
    </footer>

    </section>