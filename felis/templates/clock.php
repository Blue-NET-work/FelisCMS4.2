<?php                    
    $startDate = strtotime($startDate);
    $endDate = strtotime($endDate);
    $timezone =  gmt_to_local(time(), 'UP1');  
?>            
<!DOCTYPE HTML>
<html>
<head>
    <!-- mete dane -->
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Style -->                                                                                 
    <link href="<?php print system_url(); ?>/templates/assets/css/bootstrap/bootstrap.css" rel="stylesheet">                       
    <link href="<?php print system_url(); ?>/templates/assets/css/bootstrap/bootstrap-theme.css" rel="stylesheet">
    <link href="<?php print system_url(); ?>/templates/assets/css/styles/bnclock.css" rel="stylesheet">
    
    <!-- favicon -->
    <link rel="shortcut icon" href="<?php print system_url(); ?>/templates/assets/img/favicon.png">
                                                    
    <title>FelisCMS 4 - Site Under Construction</title>
</head>
<body>       

    <div id="felisClock">
    
        <section id="logo">
            <a href="http://blue-net.pl" title="tworzenie stron kłodzko"><img src="<?php print system_url(); ?>/templates/assets/img/logo.png" alt=""></a>    
        </section>
      
        <div class="center clockBox">
            
            <h1 class="text-info">Oops!</h1>
            
            <h3 class="text-warning"><?php print $lang["site_offline_build"]; ?></h3>
            <h5 class="muted"><?php print $lang["site_offline_back"]; ?></h5>
            
            <div class="clock-details text-error">      
                <!-- clock-->
                <div class="clock row">
                    <!-- Days -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="clock_days">
                            <div class="bgLayer">
                                <div class="topLayer"></div>
                                <canvas id="canvas_days" width="188" height="188"></canvas>
                                <div class="text">
                                    <p class="val text-danger">0</p>
                                    <p class="type_days text-danger"><?php print $lang["site_offline_days"]; ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Days -->
                    <!-- Hours -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="clock_hours">
                            <div class="bgLayer">
                                <div class="topLayer"></div>
                                <canvas id="canvas_hours" width="188" height="188"></canvas>
                                <div class="text">
                                    <p class="val text-info">0</p>
                                    <p class="type_hours text-info"><?php print $lang["site_offline_hours"]; ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hours -->
                    <!-- Minutes -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="clock_minutes">
                            <div class="bgLayer">
                                <div class="topLayer"></div>
                                <canvas id="canvas_minutes" width="188" height="188"></canvas>
                                <div class="text">
                                    <p class="val text-success">0</p>
                                    <p class="type_minutes text-success"><?php print $lang["site_offline_minutes"]; ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Minutes -->
                    <!-- Seconds -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="clock_seconds">
                            <div class="bgLayer">
                                <div class="topLayer"></div>
                                <canvas id="canvas_seconds" width="188" height="188"></canvas>
                                <div class="text">
                                    <p class="val text-warning">0</p>
                                    <p class="type_seconds text-warning"><?php print $lang["site_offline_seconds"]; ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Seconds -->              
                </div>       
                <!-- clock-->                                   
            </div> <!-- /clock-details -->
            
            <div class="clock-actions">
                <a href="http://blue-net.pl" class="btn btn-primary btn-large" title="tanie serwery www">
                    <i class="glyphicon glyphicon-dashboard"></i>
                    Go to Blue-NET                      
                </a>
                
                <a href="http://blue-net.pl/kontakt.html" class="btn btn-default btn-large">
                    <i class="glyphicon glyphicon-envelope"></i>
                    Contact Support                        
                </a>
            </div> <!-- /clock-actions -->

        </div><!-- /clockBox -->
        
    </div><!-- #felisClock -->
    
   <!-- HTML helper
    ================================================== -->
    <div id="background"></div>

   <!-- Skrypty jQ
    ================================================== -->                    
    <script type="text/javascript" src="<?php print system_url(); ?>/templates/assets/js/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="<?php print system_url(); ?>/templates/assets/js/felis/felis.bnclock.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            BNCountDown({
                secondsColor : "#ffdc50",
                secondsGlow  : "none",
                
                minutesColor : "#9cdb7d",
                minutesGlow  : "none",
                
                hoursColor   : "#378cff",
                hoursGlow    : "none",
                
                daysColor    : "#ff6565",
                daysGlow     : "none",
                                // mktime(godzina,minuta,sekunda,miesiąc,dzień,rok)
                startDate   : "<?php print $startDate; ?>",
                endDate     : "<?php print $endDate; ?>",
                now         : "<?php print $timezone;?>",
                seconds     : "<?php print date('s'); ?>"
            });
        });
    </script>
</body>
</html>