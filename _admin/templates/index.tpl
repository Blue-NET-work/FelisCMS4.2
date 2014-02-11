{config name="base_url"}{include file="helpview/header.tpl" titleTag="{lang line='dashboard_titleTag'}"} 
</head>
<body class="clearfix with-menu">  
               
    <!-- Main content
    ================================================== -->
    <section role="main" id="main">
        <section id="mainContent">  
                              
           <!-- TOP
            ================================================== -->                              
            {include file="helpview/top.tpl"}
        
            <!-- Body Header
            ================================================== -->
            <header>
                <h1 class="title"><i class="bluebits32-aplication_arrow_right"></i> {lang line="dashboard_titleTag"}</h1>
                <ul class="breadcrumb">
                  <li><a href="#">{lang line="default_control_panel"}</a> <span class="divider">»</span></li>   
                  <li class="active">{lang line="dashboard_titleTag"}</li>
                </ul>
            </header>               
            
            <!-- Alerts messages
            ================================================== -->
            {if $permissions}
            <section id="alerts">
                {foreach from=$permissions item=item name=permission}
                <div class="alert alert-danger">
                  <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
                  <strong>{lang line="default_warning"}!</strong> {lang line="folder_permission" vars=$item}.
                </div>
                {/foreach}   
            </section> 
            {/if}  
            
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
            
            <!-- Kolumns
            ================================================== -->
            <div class="row">
                <div class="col-sm-6 col-md-4 col-lg-4">
                <!-- zawartość -->

                    <h2 class="relative thin">          
                        {lang line="dashboard_new_users"}
                        <span class="button-group absolute-right">
                            <a href="javascript:openModal()" title="{lang line="dashboard_add_user"}" class="button icon1-plus-round">{lang line="default_add"}</a>
                            <a href="javascript:openLoadingModal()" title="{lang line="dashboard_reload_list"}" class="button icon1-redo"></a>
                        </span>
                    </h2>

                    <ul class="list spaced">    
                        {foreach from=$dashboard_users item=user name=user}
                        <li>                                                                                   
                            <a href="{$base_url}users/edit/{$user.id}.html" class="list-link icon1-user"> 
                              {foreach item=item from=$user.group}
                                <span class="meter {$item.user_color}" title="{$item.user_group}"></span>
                              {/foreach} 
                              <strong>{$user.first_name}</strong> {$user.last_name}
                            </a>
                            <div class="button-group absolute-right compact show-on-parent-hover">
                                <a href="{$base_url}users/edit/{$user.id}.html" class="button icon1-pencil">{lang line="default_edit"}</a>
                                <a href="#" class="button icon1-gear with-tooltip" title="Other actions"></a>
                                <a href="#" class="button icon1-trash with-tooltip confirm" title="{lang line="default_delete"}"></a>
                            </div>   
                        </li>
                        {/foreach}  
                    </ul>
                <!-- zawartość -->
                </div>
                <div class="col-sm-6 col-md-4 col-lg-4">
                <!-- zawartość -->              
                    <div class="block large-margin-bottom">
                        <div class="block-title">
                            <h3>FelisCMS Facebook</h3>
                        </div>
                            
                        <div id="fb-root"></div>
                        <script>(function(d, s, id) {
                          var js, fjs = d.getElementsByTagName(s)[0];
                          if (d.getElementById(id)) return;
                          js = d.createElement(s); js.id = id;
                          js.src = "//connect.facebook.net/pl_PL/all.js#xfbml=1&appId=211481375696214";
                          fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>
                            
                        <div class="fb-like-box" data-href="http://www.facebook.com/feliscms" data-colorscheme="light" data-show-faces="false" data-header="false" data-stream="true" data-show-border="false">             
                                                                             
                        </div>
                    </div>
                <!-- zawartość -->
                </div>
                <div class="col-sm-6 col-md-4 col-lg-4">
                <!-- zawartość -->  
                    <div class="block">
                        <!-- Block title -->
                        <div class="block-title">
                            <h3 id="agenda-day">{lang line="dashboard_agenda_tuesday"}</h3>
                            <div class="button-group absolute-right compact">
                                <a href="#" class="button" id="agenda-previous"><span class="icon1-left-fat"></span></a>
                                <a href="#" class="button" id="agenda-today">{lang line="dashboard_agenda_today"}</a>
                                <a href="#" class="button" id="agenda-next"><span class="icon1-right-fat"></span></a>
                            </div>
                        </div><!-- ./end Block title -->

                        <div class="agenda" id="agenda">
                            <!-- Time markers -->
                            <ul class="agenda-time">
                                <li class="from-7 to-8"><span>{lang line="dashboard_agenda_7AM"}</span></li>
                                <li class="from-8 to-9"><span>{lang line="dashboard_agenda_8AM"}</span></li>
                                <li class="from-9 to-10"><span>{lang line="dashboard_agenda_9AM"}</span></li>
                                <li class="from-10 to-11"><span>{lang line="dashboard_agenda_10AM"}</span></li>
                                <li class="from-11 to-12"><span>{lang line="dashboard_agenda_11AM"}</span></li>
                                <li class="from-12 to-13 blue"><span>{lang line="dashboard_agenda_NOON"}</span></li>
                                <li class="from-13 to-14"><span>{lang line="dashboard_agenda_1PM"}</span></li>
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
            
            <!-- Box z informacją o prawach
            =========================================================
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <h3>Prawa dla plików</h3>
                </div>
            </div>
             -->
                      
        </section>
    </section>
    <!-- End main content -->



   <!-- Sidebar
    ================================================== -->                                 
    {include file="helpview/sidebar.tpl"}

   <!-- HTML helper
    ================================================== -->
    <div id="background"></div>


   <!-- Skrypty jQ
    ================================================== -->                                  
    {include file="helpview/jQuery.tpl"}
                                            
    <script type='text/javascript' src='https://www.google.com/jsapi'></script>   
    <script>   
    {include file='helpview/assets/helper/dashboard.js'} 
    {literal}       

        // Chart
        var chartInit = false,
            drawVisitorsChart = function()
            {
                // Create our data table.
                var data = new google.visualization.DataTable();
            {/literal}
                var raw_data = [['{lang line="dashboard_statistic_website"}', 50, 73, 104, 129, 146, 176, 139, 149, 218, 194, 96, 53],
                                ['{lang line="dashboard_statistic_shop"}', 82, 77, 98, 94, 105, 81, 104, 104, 92, 83, 107, 91],
                                ['{lang line="dashboard_statistic_board"}', 50, 39, 39, 41, 47, 49, 59, 59, 52, 64, 59, 51],
                                ['{lang line="dashboard_statistic_others"}', 45, 35, 35, 39, 53, 76, 56, 59, 48, 40, 48, 21]];

                var months = ['{lang line="dashboard_statistic_months_jan"}', '{lang line="dashboard_statistic_months_feb"}', '{lang line="dashboard_statistic_months_mar"}', '{lang line="dashboard_statistic_months_apr"}', '{lang line="dashboard_statistic_months_may"}', '{lang line="dashboard_statistic_months_jun"}', '{lang line="dashboard_statistic_months_jul"}', '{lang line="dashboard_statistic_months_aug"}', '{lang line="dashboard_statistic_months_sep"}', '{lang line="dashboard_statistic_months_oct"}', '{lang line="dashboard_statistic_months_nov"}', '{lang line="dashboard_statistic_months_dec"}']; 
                 
                data.addColumn('string', '{lang line="dashboard_statistic_month"}');
            {literal}
                for (var i = 0; i < raw_data.length; ++i)
                {
                    data.addColumn('number', raw_data[i][0]);
                }

                data.addRows(months.length);

                for (var j = 0; j < months.length; ++j)
                {
                    data.setValue(j, 0, months[j]);
                }
                for (var i = 0; i < raw_data.length; ++i)
                {
                    for (var j = 1; j < raw_data[i].length; ++j)
                    {
                        data.setValue(j-1, i+1, raw_data[i][j]);
                    }
                }
               
                // Create and draw the visualization.
                // Learn more on configuration for the LineChart: http://code.google.com/apis/chart/interactive/docs/gallery/linechart.html
                var div = $('#chart'),
                    divWidth = div.width();
                new google.visualization.LineChart(div.get(0)).draw(data, {
                    title: '{/literal}{lang line="dashboard_statistic_monthly_unique_visitors_count"}{literal}',
                    width: divWidth,
                    height: $.template.mediaQuery.is('mobile') ? 180 : 265,
                    legend: 'right',
                    yAxis: {title: '(thousands)'},
                    backgroundColor: ($.template.ie7 || $.template.ie8) ? '#494C50' : 'transparent',    // IE8 and lower do not support transparency
                    legendTextStyle: { color: 'white' },
                    titleTextStyle: { color: 'white' },
                    hAxis: {
                        textStyle: { color: 'white' }
                    },
                    vAxis: {
                        textStyle: { color: 'white' },
                        baselineColor: '#666666'
                    },
                    chartArea: {
                        top: 35,
                        left: 30,
                        width: divWidth-40
                    },
                    legend: 'bottom'
                });          
            {/literal}
                // Message only when resizing
                if (chartInit){
                    notify('{lang line="dashboard_statistic_chart_resized"}', '{lang line="dashboard_statistic_chart_resized_info"}', {
                        icon: '{$base_url}public/img/demo/icon.png'
                    });
                }
            {literal}
                // Ready
                chartInit = true;
            };

        // Load the Visualization API and the piechart package.
        google.load('visualization', '1', {'packages': ['corechart']});
        // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(drawVisitorsChart);

        // Watch for block resizing
        $('#chart').widthchange(drawVisitorsChart);

        // Respond.js hook (media query polyfill)
        $(document).on('respond-ready', drawVisitorsChart);  
    {/literal}                                                                                                              
    </script> 
                                                           

</body>
</html>