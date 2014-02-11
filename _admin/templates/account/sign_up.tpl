{config name="base_url"}{include file="helpview/header.tpl" titleTag="{lang line='login_titleTag'}"} 
</head>
<body>

    <div id="logowanie">
        <section id="logo">
            <a href="#"><img src="{$base_url}public/img/logo.png" alt=""></a>    
            <section id="lang"> 
                <a href="#"><img src="{$base_url}public/img/icons/lang/pl.png" alt="pl"></a>
                <a href="#"><img src="{$base_url}public/img/icons/lang/us.png" alt="pl"></a>
            </section>
        </section>
        
    {if $messages}
        <section id="alert">     
            <div class="alert {$messages.boxClass}">       
              <a href="#" class="close" data-dismiss="alert">×</a>    
              <i class="{$messages.icon}"></i>
              {$messages.text}
            </div>       
        </section>
    {/if}
        
        <section id="logowanieBox">
            <h1><span>{lang line="login_administration"}</span></h1>
            <section id="form">
            <form action="" method="post"> 
                
                    <div class="row m-t-10">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                          <div class="input-group input-group-sm"> 
                              <span class="input-group-addon"><i class="woocons-user"></i></span> 
                              <input type="text" class="form-control logowanieInput" name="item[login]" placeholder="{lang line="login_username"}" value="">                                                                     
                          </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                          <div class="input-group input-group-sm"> 
                              <span class="input-group-addon"><i class="woocons-lock-closed"></i></span>
                              <input type="password" class="form-control logowanieInput" name="item[password]" placeholder="{lang line="login_password"}" value="">
                          </div>
                        </div>
                    </div>
                
                    <div class="row m-t-10">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="logowanieCheckbox">
                            <div class="btn-group" data-toggle="buttons-checkbox">   
                                <button type="button" class="btn btn-info">    
                                    <input type="hidden" id="remember" name="item[remember]">
                                    <i id="logowanieRemember"></i> {lang line="login_remember"}
                                </button>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-right">
                            <!-- Split button -->
                            <div class="btn-group">
                              <button type="submit" class="btn btn-default">{lang line="login_login_in"}</button>
                              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span>
                              </button>  
                              <ul class="dropdown-menu dropdown-menu-arrow text-left">
                                <li><a href="#" title="Facebook">{lang line="login_social"} <img src="{$base_url}public/img/social/facebook.png" width="25"></a></li>
                                <li><a href="#" title="Google">{lang line="login_social"} <img src="{$base_url}public/img/social/google.png" width="25"></a></li>
                                <li><a href="#" title="Twitter">{lang line="login_social"} <img src="{$base_url}public/img/social/twitter.png" width="25"></a></li>
                                <li><a href="#" title="Yahoo">{lang line="login_social"} <img src="{$base_url}public/img/social/yahoo.png" width="25"></a></li>
                              </ul>
                            </div>  
                        </div>
                    </div>
                      
            </form>
            </section>
        </section>
        
    </div>


   <!-- HTML helper
    ================================================== -->
    <div id="background"></div>


   <!-- Skrypty jQ
    ================================================== -->                                 
    <script src="{$base_url}public/js/jquery/jquery-1.10.2.js"></script>                  
    <script src="{$base_url}public/js/bootstrap/bootstrap.js"></script>                  
    <script src="{$base_url}public/js/jquery/jquery-ui-1.10.3.js"></script>                  
    <script> 
    {literal}             
        $('#logowanieCheckbox .btn').on('click', function(){ 
            if($("#logowanieCheckbox .btn").hasClass("active")){
                $("#remember").val("0")    
            }        
            else $("#remember").val("1");
        });  
    {/literal}   
    </script>
                                                    
    <script> 
    {literal}     
        $(function(){
            $("#logowanieBox").effect("shake",{distance: 84, times:2});    
        });   
    {/literal}
    </script> 

</body>
</html>
