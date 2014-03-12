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
                <h1 class="title"><i class="fa fa-2x fa-tachometer"></i>  {lang line="dashboard_titleTag"}</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>   
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
            
            <div class="row large-margin-top">
                <div class="col-md-4">Nowi Użytkownicy</div>
                <div class="col-md-4">????</div>
                <div class="col-md-4">Agenda</div>
            </div>
            
            <div class="row large-margin-top">
                <div class="col-md-3">Statystyki</div>
                <div class="col-md-3">??</div>
                <div class="col-md-3">
                    <!-- informacje o licencji -->
                    <div class="blockquote-box blockquote-info clearfix">
                        <div class="square pull-left"><span class="glyphicon glyphicon-info-sign glyphicon-lg"></span></div>
                        <h4>Information</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. </p>
                    </div>
                    <!-- informacje o licencji -->
                </div>
                <div class="col-md-3">Facebook</div>
            </div>
               
                          
            
            <div class="row">
        <h2>
            Blockquote Box</h2>
        <div class="col-md-6">
            <div class="blockquote-box clearfix">
                <div class="square pull-left">
                    <img src="http://placehold.it/60/8e44ad/FFF&text=B" alt="" class="" />
                </div>
                <h4>
                    Bootsnipp</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                    ante.
                </p>
            </div>
            <div class="blockquote-box blockquote-primary clearfix">
                <div class="square pull-left">
                    <span class="glyphicon glyphicon-music glyphicon-lg"></span>
                </div>
                <h4>
                    Let's music play</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                    ante. <a href="http://www.jquery2dotnet.com/search/label/jquery">jquery2dotnet</a>
                </p>
            </div>
            <div class="blockquote-box blockquote-success clearfix">
                <div class="square pull-left">
                    <span class="glyphicon glyphicon-tree-conifer glyphicon-lg"></span>
                </div>
                <h4>
                    Tree conifer</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                    ante.
                </p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="blockquote-box blockquote-info clearfix">
                <div class="square pull-left">
                    <span class="glyphicon glyphicon-info-sign glyphicon-lg"></span>
                </div>
                <h4>
                    Information</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                    ante.
                </p>
            </div>
            <div class="blockquote-box blockquote-warning clearfix">
                <div class="square pull-left">
                    <span class="glyphicon glyphicon-warning-sign glyphicon-lg"></span>
                </div>
                <h4>
                    Warning</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                    ante.
                </p>
            </div>
            <div class="blockquote-box blockquote-danger clearfix">
                <div class="square pull-left">
                    <span class="glyphicon glyphicon-record glyphicon-lg"></span>
                </div>
                <h4>
                    Danger</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a
                    ante.
                </p>
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