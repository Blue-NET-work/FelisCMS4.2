{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
{/block}

{block name="header"}
        <!-- Body Header
        ================================================== -->
        <header>
            <h1 class="title"><i class="fa fa-2x fa-tachometer"></i>  {lang line="dashboard_titleTag"}</h1>
            <ul class="breadcrumb unstyled-list">
              <li><a href="#">{lang line="default_control_panel"}</a></li>
              <li class="active">{lang line="dashboard_titleTag"}</li>
            </ul>
        </header>
{/block}

{block name="content"}


        <div class="row margin-top">
            <div class="col-md-4">
                <div class="blockquote-box blockquote-primary clearfix">
                    <div class="square pull-left"><span class="glyphicon glyphicon-bullhorn glyphicon-lg"></span></div>
                    <h4>FelisCMS :: Informacyjna Wiadomość</h4>
                    <p>To jest pierwsza wiadomość informacyjna systemu FelisCMS.</p>
                </div>
            </div>
            <div class="col-md-4">
                <!-- aktualizacja -->
                <div class="blockquote-box blockquote-warning clearfix">
                    <div class="square pull-left"><span class="glyphicon glyphicon-warning-sign glyphicon-lg"></span></div>
                    <h4>FelisCMS :: Aktualizacja</h4>
                    <p>Wydana została kolejna aktualizacja FelisCMS, zapraszamy do pobrania najnowszej wersji.</p>
                </div>
                <!-- aktualizacja -->
            </div>
            <div class="col-md-4">
                <!-- krytyczna poprawka -->
                <div class="blockquote-box blockquote-danger clearfix">
                    <div class="square pull-left"><span class="glyphicon glyphicon-exclamation-sign glyphicon-lg"></span></div>
                    <h4>FelisCMS :: Krytyczna Poprawka</h4>
                    <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. For performance reasons, the Tooltip and Popover data-apis are opt-in, meaning <strong>strong message</strong>.</p>
                </div>
                <!-- krytyczna poprawka -->
            </div>
        </div>

        <!-- Dashboard statistic
        ================================================== -->
        <div class="dashboard" id="dashboard">
            <div class="row">
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8" id="chart"></div>
                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                    <ul class="stats split-on-mobile">
                        <li><a href="{$base_url}users.html"><strong>{$dashboard_statisticNewUsers}</strong> {lang line="dashboard_statistic_new_users"}</a></li>
                        <li><strong>{$dashboard_statisticReturnUsers}</strong> {lang line="dashboard_statistic_return_users"}</li>
                        <li><a href="#"><strong>{$dashboard_statisticNewItems}</strong> {lang line="dashboard_statistic_new_items"}</a></li>
                        <li><a href="#"><strong>{$dashboard_statisticNewComments}</strong> {lang line="dashboard_statistic_new_comments"}</a></li>
                    </ul>
                </div>
            </div>
        </div>


        <!-- Dashboard users / / agenda
        ================================================== -->
        <div class="row large-margin-top">
            <div class="col-md-4">
            <!-- zawartość -->
                <h2 class="relative thin">
                    {lang line="dashboard_new_users"}
                    <span class="button-group absolute-right">
                        <a href="javascript:openModal()" title="{lang line="dashboard_add_user"}" class="button icon-plus">{lang line="default_add"}</a>
                        <a href="javascript:openLoadingModal()" title="{lang line="dashboard_reload_list"}" class="button icon-redo"></a>
                    </span>
                </h2>

                <ul class="list spaced">
                    {foreach from=$dashboard_users item=user name=user}
                    <li>
                        <a href="{$base_url}users/edit/{$user.id}.html" class="list-link icon-user">
                          {foreach item=item from=$user.group}
                            <span class="meter {$item.user_color}" title="{$item.user_group}"></span>
                          {/foreach}
                          <strong>{$user.first_name}</strong> {$user.last_name}
                        </a>
                        <div class="button-group absolute-right compact show-on-parent-hover">
                            <a href="{$base_url}users/edit/{$user.id}.html" class="button icon-pencil">{lang line="default_edit"}</a>
                            <a href="#" class="button icon-gear with-tooltip" title="Other actions"></a>
                            <a href="#" class="button icon-trash with-tooltip confirm" title="{lang line="default_delete"}"></a>
                        </div>
                    </li>
                    {/foreach}
                </ul>
            <!-- zawartość -->
            </div>
            <div class="col-md-4">????</div>
            <div class="col-md-4">
            <!-- zawartość -->
                <div class="block">
                    <!-- Block title -->
                    <div class="block-title">
                        <h3 id="agenda-day">{lang line="dashboard_agenda_tuesday"}</h3>
                        <div class="button-group absolute-right compact">
                            <a href="#" class="button" id="agenda-previous"><span class="icon-left-fat"></span></a>
                            <a href="#" class="button" id="agenda-today">{lang line="dashboard_agenda_today"}</a>
                            <a href="#" class="button" id="agenda-next"><span class="icon-right-fat"></span></a>
                        </div>
                    </div><!-- ./end Block title -->

                    <div class="agenda" id="agenda">
                        <!-- Time markers -->
                        <ul class="agenda-time">
                            <li class="from-7 to-8"><span>{lang line="dashboard_agenda_7AM"}</span></li>
                            <li class="from-8 to-9"><span>{lang line="dashboard_agenda_8AM"}</span></li>
                            <li class="from-9 to-10"><span>{lang line="dashboard_agenda_9AM"}</span></li>
                            <li class="from-10 to-11"><span>{lang line="dashboard_agenda_10AM"}</span></li>
                            <li class="from-11 to-12 red"><span>{lang line="dashboard_agenda_11AM"}</span></li>
                            <li class="from-12 to-13 blue"><span>{lang line="dashboard_agenda_NOON"}</span></li>
                            <li class="from-13 to-14 green"><span>{lang line="dashboard_agenda_1PM"}</span></li>
                            <li class="from-14 to-15"><span>{lang line="dashboard_agenda_2PM"}</span></li>
                            <li class="from-15 to-16"><span>{lang line="dashboard_agenda_3PM"}</span></li>
                            <li class="from-16 to-17"><span>{lang line="dashboard_agenda_4PM"}</span></li>
                            <li class="from-17 to-18"><span>{lang line="dashboard_agenda_5PM"}</span></li>
                            <li class="from-18 to-19"><span>{lang line="dashboard_agenda_6PM"}</span></li>
                            <li class="from-19 to-20"><span>{lang line="dashboard_agenda_7PM"}</span></li>
                            <li class="at-20"><span>{lang line="dashboard_agenda_8PM"}</span></li>
                        </ul><!-- ./end Time markers -->

                        <!-- Columns wrapper -->
                        <div class="agenda-wrapper">
                            <!-- Events list -->
                            <div class="agenda-events agenda-day1"></div>
                            <!-- Events list -->
                            <div class="agenda-events agenda-day2"></div>
                            <!-- Events list -->
                            <div class="agenda-events agenda-day3"></div>
                            <!-- Events list -->
                            <div class="agenda-events agenda-day4"></div>
                            <!-- Events list -->
                            <div class="agenda-events agenda-day5"></div>
                            <!-- Events list -->
                            <div class="agenda-events agenda-day6"></div>
                            <!-- Events list -->
                            <div class="agenda-events agenda-day7"></div>
                        </div><!-- ./end Columns wrapper -->
                    </div><!-- ./end Agenda -->
                </div><!-- ./end block -->
            <!-- zawartość -->
            </div>
        </div>

            <div class="row large-margin-top">
                <div class="col-md-3">
                <!-- zawartość -->
                    <div class="block large-margin-bottom">
                        <div class="block-title">
                            <h3><i class="icon-pie-chart"></i> {lang line="default_sidebar_menu_statistic"}</h3>
                        </div>
                        <div class="with-padding">
                            <p><i class="icon-pages"></i> <strong>{lang line="default_sidebar_menu_pages"}:</strong> 10</p>
                            <p><i class="icon-bullet-list"></i> <strong>{lang line="default_sidebar_menu_articles"}:</strong> 10</p>
                            <p><i class="icon-pictures"></i> <strong>{lang line="default_sidebar_menu_galleries"}:</strong> 10</p>
                            <p><i class="icon-users"></i> <strong>{lang line="default_sidebar_menu_users"}:</strong> 10</p>
                        </div>
                    </div>
                <!-- zawartość -->
                </div>
                <div class="col-md-3">??</div>
                <div class="col-md-3">
                    <!-- informacje o licencji -->
                    <div class="blockquote-box blockquote-info clearfix">
                        <div class="square pull-left"><span class="glyphicon glyphicon-info-sign glyphicon-lg"></span></div>
                        <h4>FelisCMS Licencja</h4>
                        <p>Domena: domena.pl</p>
                        <p>Data utworzenia: 2013-02-13 12:21:12</p>
                    </div>
                    <!-- informacje o licencji -->
                </div>
                <div class="col-md-3">
                <!-- zawartość -->
                    <div class="block large-margin-bottom">
                        <div class="block-title">
                            <h3><i class="fa fa-facebook-square"></i> FelisCMS Facebook</h3>
                        </div>
                        <div id="fb-root"></div>
                        <script>(function(d, s, id) {
                          var js, fjs = d.getElementsByTagName(s)[0];
                          if (d.getElementById(id)) return;
                          js = d.createElement(s); js.id = id;
                          js.src = "//connect.facebook.net/pl_PL/all.js#xfbml=1&appId=211481375696214";
                          fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                        <div class="fb-like-box" data-href="http://www.facebook.com/feliscms" data-colorscheme="light" data-show-faces="false" data-header="false" data-stream="true" data-show-border="false"></div>
                    </div>
                <!-- zawartość -->
                </div>
            </div>

{/block}