<?php

/*
 *---------------------------------------------------------------
 * APPLICATION ENVIRONMENT
 *---------------------------------------------------------------        
 */                         
 
    define('ENVIRONMENT', 'development');

/*
 *---------------------------------------------------------------
 * ERROR REPORTING
 *---------------------------------------------------------------               
 */
switch (ENVIRONMENT)
{
    case 'development':
        error_reporting(-1);
        ini_set('display_errors', 1);
    break;

    case 'testing':
    case 'production':
        error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
        ini_set('display_errors', 0);
    break;

    default:
        header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
        echo 'The application environment is not set correctly.';
        exit(1); // EXIT_* constants not yet defined; 1 is EXIT_ERROR, a generic error.
}                    


/*
 * --------------------------------------------------------------------
 * DEFAULT CONTROLLER
 * --------------------------------------------------------------------
 *
 * Normally you will set your default controller in the routes.php file.
 * You can, however, force a custom routing by hard-coding a
 * specific controller class/function here. For most applications, you
 * WILL NOT set your routing here, but it's an option for those
 * special instances where you might want to override the standard
 * routing in a specific front controller that shares a common CI installation.
 *
 * IMPORTANT: If you set the routing here, NO OTHER controller will be
 * callable. In essence, this preference limits your application to ONE
 * specific controller. Leave the function name blank if you need
 * to call functions dynamically via the URI.
 *
 * Un-comment the $routing array below to use this feature
 */
    // The directory name, relative to the "controllers" folder.  Leave blank
    // if your controller is not in a sub-folder within the "controllers" folder
    // $routing['directory'] = '';

    // The controller class file name.  Example:  mycontroller
    // $routing['controller'] = '';

    // The controller function you wish to be called.
    // $routing['function']    = '';


/*
 * -------------------------------------------------------------------
 *  CUSTOM CONFIG VALUES
 * -------------------------------------------------------------------
 *
 * The $assign_to_config array below will be passed dynamically to the
 * config class when initialized. This allows you to set custom config
 * items or override any default config values found in the config.php file.
 * This can be handy as it permits you to share one application between
 * multiple front controller files, with each file containing different
 * config values.
 *
 * Un-comment the $assign_to_config array below to use this feature
 */
    // $assign_to_config['name_of_config_item'] = 'value of config item';


/*
|---------------------------------------------------------------
| DEFAULT TIMEZONE
|---------------------------------------------------------------
|
| Set the default timezone for date/time functions to use if
| none is set on the server.
|
*/                              
date_default_timezone_set('Europe/Warsaw'); 
         

/*
 * --------------------------------------------------------------------
 * LOAD THE BOOTSTRAP FILE
 * --------------------------------------------------------------------      
 */
require_once 'CodeIgniter.php';

/*

if(phpversion() > "5.3")
 require_once BASEPATH.'core/CodeIgniter.php';
else
 require_once BASEPATH.'core/CodeIgniter_php5_0.php';

*/
    