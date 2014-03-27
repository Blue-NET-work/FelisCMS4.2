{config name="base_url"}{include file="helpview/header.tpl" titleTag="{lang line='pages_titleTag1'}"} 
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
                <h1 class="title"><i class="bluebits32-document_add"></i> {lang line="pages_titleTag1"}</h1>
                <ul class="breadcrumb">
                  <li><a href="{$base_url}">{lang line="default_control_panel"}</a> <span class="divider">»</span></li>
                  <li><a href="{$base_url}{$uri[1]}">{lang line="default_sidebar_menu_pages"}</a> <span class="divider">»</span></li>
                  <li class="active">{lang line="default_add"}</li>
                </ul>                  
            </header>     
            
                        
            <!-- panel -->  
            <div class="panel panel-black" id="panel">
              <div class="panel-heading">{lang line="pages_titleTag1"} 
                <div class="absolute-right">
                    <!-- cart (show hide) -->
                    <ul class="nav nav-tabs" id="navTabs">
                        <li><a href="#data" data-toggle="tab" class="panel-link">{lang line="default_data"}</a></li>
                        <li><a href="#desc" data-toggle="tab" class="panel-link">{lang line="default_description"}</a></li> 
                    </ul>
                    <!-- toggle (show hide) -->
                    <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>                                                                                                          
                </div>
              </div>
              <!-- ./end panel-heading -->  
              <div id="panel-body" class="panel-body in"> 
              
                <form action="" method="POST">           
                    <!-- tab -->
                    <div class="tab-content with-padding">
                        <div class="tab-pane fade" id="data">
                            <div class="row">
                                <div class="col-md-6">                     
                                    
                                    <p><b>{lang line="default_meta_data"} 
                                    <span class="info-spot">
                                        <span class="icon1-info-round"></span>
                                        <span class="info-bubble">
                                            {lang line="default_meta_data_info"}
                                        </span>
                                    </span>
                                    </b></p> 
                                    
                                    <div class="form-group block-label">
                                        <label for="item[meta_title]" class="text-info">{lang line="default_title_site"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                        <input type="text" name="item[meta_title]" id="item[meta_title]" class="input form-control" value="">
                                    </div>
                                    
                                    <div class="form-group block-label">
                                        <label for="item[meta_keywords]" class="text-info">{lang line="default_meta_keywords"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                        <input type="text" name="item[meta_keywords]" id="item[meta_keywords]" class="input form-control" value="">
                                    </div>
                                    
                                    <div class="form-group block-label">
                                        <label for="item[meta_description]" class="text-info">{lang line="default_meta_description"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                        <input type="text" name="item[meta_description]" id="item[meta_description]" class="input form-control" value="">
                                    </div>
                                        
                                </div><!-- ./end span6 -->
                                <div class="col-md-6">      
                                
                                    <p><b>{lang line="default_site_data"}</b></p>
                                    
                                    <div class="form-group block-label">
                                        <label for="item[name]" class="text-info">{lang line="default_name"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                        <input type="text" name="item[name]" id="item[name]" class="input form-control FelisNazwa" value="">
                                    </div>     
                                    
                                    <div class="form-group block-label">
                                        <label for="item[alias]" class="text-info">{lang line="default_show_adres"}: <small>(255 {lang line="default_chars_max"}.)</small></label>
                                        <input type="text" name="item[alias]" id="item[alias]" class="input form-control FelisAlias" value="">
                                    </div>    
                            
                                    <div class="form-group block-label">
                                        <label for="item[parent_id]" class="text-info">{lang line="default_category"}:</label>   
                                        <select name="item[parent_id]" class="select check-list">    
                                            <option value="0" selected>{lang line="default_category_no"}</option> 
                                        {foreach from=$pages item=item name=pages}
                                            <option value="{$item.id}">{$item.name}</option>
                                            {if $item.children}
                                            <optgroup>   
                                            {foreach from=$item.children item=items name=pagess} 
                                                <option value="{$items.id}">{$items.name}</option> 
                                            {/foreach} 
                                            </optgroup>
                                            {/if}
                                        {/foreach}
                                        </select>  
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="item[active]" class="text-info">{lang line="default_active"}:</label>               
                                        <input type="checkbox" name="item[active]" checked="checked" id="item[active]" class="switch mid-margin-right" value="1">  
                                    </div>                                                                                
                                            
                                </div><!-- ./end span6 -->
                            </div>     
                            
                            <!-- button action-->
                            <div class="row" style="margin-top:20px;">
                                <div class="col-md-6">  
                                </div>
                                <div class="col-md-6 text-right">                                       
                                    <a href="#desc" class="button tabChange">
                                        <span class="button-icon anthracite-gradient"><span class="icon1-fwd"></span></span>
                                        {lang line="default_next"}
                                    </a>        
                                </div>
                            </div>   
                            
                        </div> <!-- #/end data -->
                        <div class="tab-pane fade" id="desc">
                        
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="item[description]" class="text-info">{lang line="default_description"}:</label>  
                                    <textarea name="item[description]" id="item[description]" class="ckeditor"></textarea>
                                </div>
                            </div> 
                            
                            <!-- button action-->
                            <div class="row" style="margin-top:20px;">
                                <div class="col-md-6">                                         
                                    <a href="#data" class="button tabChange">
                                        <span class="button-icon anthracite-gradient"><span class="icon1-reply"></span></span>
                                        {lang line="default_back"}
                                    </a>
                                </div> 
                                <div class="col-md-6 text-right">   
                                    <button type="submit" class="button">
                                        <span class="button-icon green-gradient"><span class="icon1-tick"></span></span>
                                        {lang line="default_save"}
                                    </button>   
                                </div>
                            </div>                                                                                                                                                             
                                   
                             
                        </div>                             
                    </div>
                    <!-- tab -->  
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
                                    
</body>
</html>