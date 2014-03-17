<?php        
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>FelisCMS 4 - Database Error</title>
    <link href="/felis/templates/assets/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="/felis/templates/assets/css/bootstrap/bootstrap-theme.css" rel="stylesheet" type="text/css">
    <link href="/felis/templates/assets/css/styles/error.css" rel="stylesheet" type="text/css">
</head>
<body>

    <div id="error">           
        <section id="logo"><a href="http://Blue-NET.pl"><img src="/felis/templates/assets/img/logo.png" alt=""></a></section>
        <div class="center errorBox">
            <h1 class="text-info">Oops!</h1>      
            <h3 class="text-warning"><?php echo $heading; ?></h3>
            <img src="/felis/templates/assets/img/errors/database_search.png" alt="">
            <div class="error-details text-danger">
                <?php echo $message; ?>
            </div> <!-- /error-details -->                          
            <div class="error-actions">
                <a href="./index.html" class="btn btn-primary btn-large">
                    <i class="glyphicon glyphicon-arrow-left"></i>
                    Back to Dashboard                        
                </a>                                                
                <a href="http://blue-net.pl/kontakt.html" class="btn btn-default btn-large">
                    <i class="glyphicon glyphicon-envelope"></i>
                    Contact Support                        
                </a>
            </div> <!-- /error-actions -->                          
        </div><!-- /errorBox -->                                    
    </div><!-- #error -->
    
   <!-- HTML helper
    ================================================== -->
    <div id="background"></div>
                                      
</body>
</html>                               