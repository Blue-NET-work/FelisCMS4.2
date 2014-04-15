<!DOCTYPE HTML>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>

    <title>FelisCMS 4 - {lang line='felis_login_title'}</title>
    <!-- mete dane -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="Mateusz Serwinowski (serwin) - Blue-NET.pl">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="user-scalable=0, initial-scale=1.0, target-densitydpi=115">

    <!-- Style -->
	{stylesheet style=$_CSS}

    <!-- favglyphicon glyphicon-->
    <link rel="shortcut icon" href="{$TEMPLATES}assets/img/favicon.png">
    <!-- Microsoft clear type rendering -->
    <meta http-equiv="cleartype" content="on">
    <!-- JavaScript at bottom except for Modernizr -->
    <script src="{$TEMPLATES}assets/js/libs/modernizr.custom.js"></script>


    <!-- For all browsers -->
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/style.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis.style.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis.colors.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis.fonts.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis.responsive.css">
    <link rel="stylesheet" media="print" href="{$TEMPLATES}assets/css/print.css">

    <!-- Additional styles -->
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis/felis.agenda.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis/felis.dashboard.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis/felis.form.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis/felis.modal.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis/felis.progress-slider.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/felis/felis.switches.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/css/fonts/font-awesome/font-awesome.css">

    <!-- Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" media="screen" href="{$TEMPLATES}assets/css/login.css">

</head>
<body>

    <div id="container">

        <hgroup id="login-title" class="large-margin-bottom">
            <h1 class="login-title-image"><a href="http://blue-net.pl"><img src="{$TEMPLATES}assets/img/logo.png" alt=""></a></h1>
            <h5>{lang line='felis_login_administration'}</h5>
        </hgroup>

        <div id="form-block" class="scratch-metal">
            <form method="post" action="{$base_url}dashboard/sign_in.html" id="form-login" class="input-wrapper blue-gradient glossy" title="Login">
                <ul class="inputs large">
					<li><span class="icon-user mid-margin-right"></span><input type="text" name="item[login]" id="login" value="" class="input-unstyled" placeholder="{lang line='felis_login_username'}" autocomplete="off"></li>
					<li><span class="icon-lock mid-margin-right"></span><input type="password" name="item[password]" id="pass" value="" class="input-unstyled" placeholder="{lang line='felis_login_password'}" autocomplete="off"></li>
				</ul>

                <p class="button-height">
                    <button type="submit" class="button glossy float-right" id="login">{lang line="felis_login_login_in"}</button>
                    <input type="checkbox" name="item[remember]" id="remind" value="1" checked="checked" class="switch tiny mid-margin-right with-tooltip" title="{lang line="felis_login_remember_info"}">
                    <label for="remind">{lang line="felis_login_remember"}</label>
                </p>
            </form>
        </div>

    </div>


{include file="assets/helpview/footer.tpl"}

    <script>

        $(document).ready(function(){

             var doc = $('html').addClass('js-login'),
                container = $('#container'),
                formBlock = $('#form-block'),

                centered;

            $('#form-login').on("submit", function(event)
            {
                // Values
                var url = "{$base_url}dashboard/sign_in.html",
                    login = $.trim($('#login').val()),
                    pass = $.trim($('#pass').val()),
                    remind = $.trim($('#remind').val());

                // Check inputs
                if (login.length === 0){
                    displayError('{lang line="felis_login_please_fill_username"}');
                    return false;
                }
                else if (pass.length === 0){
                    // Remove empty login message if displayed
                    formBlock.clearMessages('{lang line="felis_login_please_fill_username"}');

                    // Display message
                    displayError('{lang line="felis_login_please_fill_password"}');
                    return false;
                }
                else
                {
                    // Remove previous messages
                    formBlock.clearMessages();

                    // Show progress
                    displayLoading('{lang line="felis_login_checking_credentials"}');

                    // Stop normal behavior
                    event.preventDefault();


                     // This is where you may do your AJAX call, for instance:
                      $.ajax(url, {
                            type: "POST",
                            dataType: 'json',
                            data: $('#form-login').serialize(),
                            success: function(data){
                              if (data.logged){
                                  formBlock.clearMessages();
                                  displaySuccess(data.messages);
                                  document.location.href = 'index.html';
                              }
                              else{
                                  formBlock.clearMessages();
                                  displayError(data.messages);
                              }
                            },
                            error: function(){
                              formBlock.clearMessages();
                              displayError('{lang line="felis_login_error_contacting"}');
                            }
                      });

                    // Simulate server-side check
                    /*
                    setTimeout(function() {
                        document.location.href = './'
                    }, 2000);
                    */
                }
            });

            /******* END OF EDIT SECTION *******/

            // Handle resizing (mostly for debugging)
            function handleLoginResize()
            {
                // Detect mode
                centered = (container.css('position') === 'absolute');

                // Set min-height for mobile layout
                if (!centered)
                {
                    container.css('margin-top', '');
                }
                else
                {
                    if (parseInt(container.css('margin-top'), 10) === 0)
                    {
                        centerForm(false);
                    }
                }
            };

            // Register and first call
            $(window).bind('normalized-resize', handleLoginResize);
            handleLoginResize();

            /*
             * Center function
             * @param boolean animate whether or not to animate the position change
             * @param string|element|array any jQuery selector, DOM element or set of DOM elements which should be ignored
             * @return void
             */
            function centerForm(animate, ignore)
            {
                // If layout is centered
                if (centered)
                {
                    var siblings = formBlock.siblings(),
                        finalSize = formBlock.outerHeight();

                    // Ignored elements
                    if (ignore)
                    {
                        siblings = siblings.not(ignore);
                    }

                    // Get other elements height
                    siblings.each(function(i)
                    {
                        finalSize += $(this).outerHeight(true);
                    });

                    // Setup
                    container[animate ? 'animate' : 'css']({ marginTop: -Math.round(finalSize/2)+'px' });
                }
            };

            // Initial vertical adjust
            centerForm(false);

            /**
             * Function to display error messages
             * @param string message the error to display
             */
            function displayError(message){
                // Show message
                var message = formBlock.message(message, {
                    append: false,
                    arrow: 'bottom',
                    classes: ['red-gradient icon-warning'],
                    animate: true                    // We'll do animation later, we need to know the message height first
                });

                // Vertical centering (where we need the message height)
                centerForm(true, 'fast');

                // Watch for closing and show with effect
                message.bind('endfade', function(event)
                {
                    // This will be called once the message has faded away and is removed
                    centerForm(true, message.get(0));

                }).hide().slideDown('fast');
            }
            function displaySuccess(message){
                // Show message
                var message = formBlock.message(message, {
                    append: false,
                    arrow: 'bottom',
                    classes: ['green-gradient icon-tick'],
                    animate: true                    // We'll do animation later, we need to know the message height first
                });

                // Vertical centering (where we need the message height)
                centerForm(true, 'fast');

                // Watch for closing and show with effect
                message.bind('endfade', function(event)
                {
                    // This will be called once the message has faded away and is removed
                    centerForm(true, message.get(0));

                }).hide().slideDown('fast');
            }

            /**
             * Function to display loading messages
             * @param string message the message to display
             */
            function displayLoading(message){
                // Show message
                var message = formBlock.message('<strong>'+message+'</strong>', {
                    append: false,
                    arrow: 'bottom',
                    classes: ['blue-gradient icon-hourglass', 'align-center'],
                    stripes: true,
                    darkStripes: false,
                    closable: false,
                    animate: false                    // We'll do animation later, we need to know the message height first
                });

                // Vertical centering (where we need the message height)
                centerForm(true, 'fast');

                // Watch for closing and show with effect
                message.bind('endfade', function(event)
                {
                    // This will be called once the message has faded away and is removed
                    centerForm(true, message.get(0));

                }).hide().slideDown('fast');
            }
        });

        // What about a notification?
        notify('{lang line="felis_login_info_access_title"}', '{$messages}', {
            icon: '{$TEMPLATES}assets/img/demo/icon.png'
        });

    </script>

</body>
</html>