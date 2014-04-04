{config name="base_url"}{include file="helpview/header.tpl" titleTag="{lang line='users_you'}"} 
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
                <h1 class="title"><i class="bluebits32-document_search"></i> {lang line='users_you'}</h1>
                <ul class="breadcrumb">
                  <li><a href="{$base_url}">{lang line="default_control_panel"}</a> <span class="divider">»</span></li>
                  <li><a href="{$base_url}{$uri[1]}">{lang line="default_sidebar_menu_users"}</a> <span class="divider">»</span></li>
                  <li class="active">{lang line="users_you"}</li>
                </ul>                
            </header>
                 
            <!-- panel -->  
            <div class="panel panel-black" id="panel">
              <div class="panel-heading">{lang line="users_you"}
                <div class="absolute-right">
                    <!-- toggle (show hide) -->
                    <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>                                                                                                          
                </div>
              </div>
              <!-- ./end panel-heading -->  
              <div id="panel-body" class="panel-body in">    
                                               
                <form action="" method="POST">                                              
                     
                     <div class="row"> 
                        
                        <div class="col-md-4">
                            
                            <div class="form-group block-label">
                                <label for="item[username]" class="text-info">{lang line="users_username"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                <input type="text" name="item[username]" id="item[username]" class="input form-control">
                            </div>      
                            
                            <div class="form-group block-label">
                                <label for="item[avatar]" class="text-info">{lang line="users_avatar"}:</label>      
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="row">
                                        <div class="col-md-6">                                                                                         
                                          <div class="fileinput-new thumbnail" style="max-width: 150px; max-height: 150px;">  
                                            {if $user->avatar !=""}<img src="{$base_url}../uploads/avatar/{$user->avatar}" alt="{$user->avatar}">{/if}
                                          </div>
                                          <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 150px;"></div>
                                        </div>
                                        <div class="col-md-6">      
                                            <span class="btn btn-default btn-file"><span class="fileinput-new">{lang line="users_avatar_select"}</span><span class="fileinput-exists">{lang line="users_avatar_change"}</span>
                                            <input type="file" name="item[avatar]" id="item[avatar]" value="{$user->avatar}"></span>
                                            <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">{lang line="users_avatar_remove"}</a>
                                        </div>
                                    </div> 
                                </div>        
                            </div>
                                  
                        </div>
                        
                        <div class="col-md-4">
                            
                            <div class="form-group block-label">
                                <label for="item[email]" class="text-info">{lang line="users_email"}:</label>
                                <input type="text" name="item[email]" id="item[email]" class="input form-control" value="{$user->email}">
                            </div>   
                            
                            <div class="form-group block-label">
                                <label for="item[phone]" class="text-info">{lang line="users_phone"}:</label>
                                <input type="text" name="item[phone]" id="item[phone]" class="input form-control" value="{$user->phone}">
                            </div>         
                            
                        </div>
                        
                        <div class="col-md-4">  
                            
                            <div class="form-group block-label">
                                <label for="item[company]" class="text-info">{lang line="users_company"}:</label>
                                <input type="text" name="item[company]" id="item[company]" class="input form-control" value="{$user->company}">
                            </div>    
                        
                            <div class="form-group block-label">
                                <label for="item[first_name]" class="text-info">{lang line="users_first_name"}:</label>
                                <input type="text" name="item[first_name]" id="item[first_name]" class="input form-control" value="{$user->first_name}">
                            </div>  
                            
                            <div class="form-group block-label">
                                <label for="item[last_name]" class="text-info">{lang line="users_last_name"}:</label>
                                <input type="text" name="item[last_name]" id="item[last_name]" class="input form-control" value="{$user->last_name}">
                            </div>     
                            
                        </div>
                        
                     </div>                                                

                    <!-- button action-->
                    <div class="row" style="margin-top:20px;">
                        <div class="col-md-12 text-right">          
                            <button type="submit" class="button">
                                <span class="button-icon green-gradient"><span class="icon1-tick"></span></span>
                                {lang line="default_save"}
                            </button> 
                        </div> 
                    </div>    
                          
                </form> 
                            
              </div>
            </div> 
            <!-- panel -->   

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
    <script>
    {include file="helpview/assets/helper/bootstrap-datatables.js"}
    {include file="helpview/assets/helper/users.js"}
    </script>
                                    
</body>
</html>         