        <!-- Logo
        ================================================== -->
        <header id="logo">
            <a href="http://blue-net.pl"><img src="{$TEMPLATES}assets/img/logo.png" alt=""></a>
        </header>
        
        <!-- Access
        ================================================== -->
        <ul id="access">
            <li><a href="#" class="icon-calendar with-tooltip" title="{lang line="default_sidebar_access_calendar"}"></a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle with-tooltip" role="button" data-toggle="dropdown" data-hover="dropdown" title="{lang line="default_sidebar_access_lang"}"><span class="icon-flag"></span><b class="caret"></b></a>
                <ul id="lang" class="dropdown-menu dropdown-menu-arrow" role="menu" aria-labelledby="drop1">
                  <li><a href="{$base_url}dashboard/language/pl.html"><i class="lang-pl"></i> {lang line="felis_lang_polish"}</a></li>  
                  <li><a href="{$base_url}dashboard/language/en.html"><i class="lang-us"></i> {lang line="felis_lang_english"}</a></li>
                  <li><a href="{$base_url}dashboard/language/de.html"><i class="lang-de"></i> Niemiecki</a></li>
                  <li><a href="{$base_url}dashboard/language/ru.html"><i class="lang-ru"></i> Ruski</a></li>  
                </ul>
            </li>
            <li><a href="{$base_url}messages.html"><span class="icon-inbox with-tooltip" title="{lang line="default_sidebar_access_messages"}"></span>{if $messages_count}<span class="count">{$messages_count}</span>{/if}</a></li>
            <li><a href="#" data-href="{$root_url}" class="icon-monitor with-tooltip preview" title="{lang line="default_sidebar_access_preview"}"></a></li>
            <li><a href="{$base_url}dashboard/logout.html" class="icon-logout with-tooltip" title="{lang line="default_sidebar_access_logout"}"></a></li>
        </ul>