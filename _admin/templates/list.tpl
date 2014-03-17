{include file="assets/helpview/head.tpl" titleTag="{lang line='pages_titleTag'}"}  
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
                <h1 class="title"><i class="fa fa-2x fa-list"></i>  {lang line="pages_titleTag"}</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>   
                  <li class="active">{lang line="pages_titleTag"}</li>
                </ul>
            </header>  
                                 
            <div class="panel panel-default panel-black" id="panel">                                 
                <div class="panel-heading">{lang line="pages_titleTag"}
                    <div class="absolute-right">
                        <!-- toggle (show hide) -->
                        <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>                                                                                                          
                    </div>
                </div>
                <!-- ./end panel-heading -->  
                <div id="panel-body" class="panel-body in">
                    <p>Tutaj body belki</p>
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