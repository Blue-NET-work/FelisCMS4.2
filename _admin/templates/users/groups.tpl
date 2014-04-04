{config name="base_url"}{include file="helpview/header.tpl" titleTag="{lang line='users_ug_list'}"} 
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
                <h1 class="title"><i class="bluebits32-document_search"></i> {lang line="users_ug_list"}</h1>
                <ul class="breadcrumb">
                  <li><a href="{$base_url}">{lang line="default_control_panel"}</a> <span class="divider">»</span></li>
                  <li><a href="{$base_url}{$uri[1]}">{lang line="default_sidebar_menu_users"}</a> <span class="divider">»</span></li>
                  <li class="active">{lang line="users_ug_list"}</li>
                </ul>                
            </header>
                 
            <!-- panel -->  
            <div class="panel panel-black" id="panel">
              <div class="panel-heading">{lang line="users_ug_list"}
                <div class="absolute-right">       
                    <!-- toggle (show hide) -->
                    <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>                                                                                                          
                </div>
              </div>
              <!-- ./end panel-heading -->  
              <div id="panel-body" class="panel-body in">    
              
                    <a href="" class="button block margin-bottom">
                        <span class="button-icon blue-gradient"><span class="icon1-plus"></span></span>
                        Dodaj Grupę
                    </a>
              
                <table class="datatable table table-striped table-hover" id="table">
                  <thead>
                    <tr>
                        <th style="min-width:30px;">ID</th>
                        <th>{lang line="users_ug_name"}</th>
                        <th>{lang line="users_ug_description"}</th>   
                        <th style="width: 90px; text-align: center;">{lang line="default_action"}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$groups item=item name=users}
                        <!-- wpis -->
                            <tr>
                                <td>{$item->ug_id}</td>
                                <td>                                     
                                    <span class="meter {$item->ug_color}" title="{$item->ug_name}"></span>  
                                    {$item->ug_name}
                                </td>
                                <td>{$item->ug_description}</td>                          
                                <td class="actions">
                                    <a href="#" data-item="{$item->ug_id}" title="{lang line="default_edit"}" class="felisEdit with-tooltip coquette16-pencil disabled"></a>
                                    <a href="#" data-item="{$item->ug_id}" title="{lang line="default_delete"}" class="felisDel coquette16-delete with-tooltip confirm disabled"></a>
                                </td>
                            </tr>
                        <!-- koniec wpisu -->
                    {/foreach}
                  </tbody>
                </table> 
                            
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