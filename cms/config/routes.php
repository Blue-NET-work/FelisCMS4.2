<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
|	$route['default_controller'] = 'welcome';
|
|	$route['404_override'] = 'errors/page_missing';
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'dashboard';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

//Nagrody
$route['nagrody/(.*)']    		= 'nagrody/$1';
$route['nagrody']    			= 'nagrody';

//Nagrody
$route['hotele/(.*)']    		= 'hotele/$1';
$route['hotele']    			= 'hotele';

//Panel
$route['panel/(.*)']    		= 'panel/$1';
$route['panel']    				= 'panel';

//Dashboard
$route['okolicznosciowe']    	= 'dashboard/okolicznosciowe';
$route['oferta_tygodnia']    	= 'dashboard/oferta_tygodnia';
$route['rejestracja']    		= 'dashboard/register';
$route['zaloguj']    			= 'dashboard/sign_in';
$route['wyloguj']    			= 'dashboard/logout';
$route['szukaj']    			= 'dashboard/szukaj';
$route['test_maila']    		= 'dashboard/testEmail';
$route['oferta/(.*)']     		= 'dashboard/oferta/$1';
$route['pakiet/(.*)']    		= 'dashboard/pakiet/$1';
$route['artykul/(.*)_(.*)']    = 'dashboard/article/$1/$2';
$route['(.*)']                 	= 'dashboard/pages/$1';
