{include file="assets/helpview/head.tpl" titleTag="{lang line='dashboard_titleTag'}"}  
</head>
<body class="clearfix with-menu">

                            
    <!-- Main content
    ================================================== -->
    <section role="main" id="main">
        <section id="mainContent">     
            {include file="assets/helpview/header.tpl"}        
        
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
            
          </section>                                                       
    </section>                                                       

   <!-- Sidebar
    ================================================== -->                                 
    {include file="assets/helpview/sidebar.tpl"}  
          
{include file="assets/helpview/footer.tpl"} 
                           
</body>
</html>