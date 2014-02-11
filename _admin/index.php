<?php
       
/*
 *---------------------------------------------------------------
 * ROOT FOLDER NAME
 *---------------------------------------------------------------  
 */
    $root_path = '../';

/*
 *---------------------------------------------------------------
 * SYSTEM FOLDER NAME
 *---------------------------------------------------------------   
 */
	$system_path = '../felis';

/*
 *---------------------------------------------------------------
 * APPLICATION FOLDER NAME
 *---------------------------------------------------------------       
 */
	$application_folder = './';

/*
 *---------------------------------------------------------------
 * VIEW FOLDER NAME
 *--------------------------------------------------------------- 
 */
    $view_folder = 'templates';

/*
 *---------------------------------------------------------------
 * UPLOAD FOLDER NAME
 *--------------------------------------------------------------- 
 */
	$uploads_folder = '../uploads';


// --------------------------------------------------------------------
// END OF USER CONFIGURABLE SETTINGS.  DO NOT EDIT BELOW THIS LINE
// --------------------------------------------------------------------

/*
 * ---------------------------------------------------------------
 *  Resolve the system path for increased reliability
 * ---------------------------------------------------------------
 */

    // Set the current directory correctly for CLI requests
    if (defined('STDIN')){chdir(dirname(__FILE__));}                                               
    if (($_temp = realpath($system_path)) !== FALSE){$system_path = $_temp.'/';}else{$system_path = rtrim($system_path, '/').'/';}
                               
    // Is the system path correct?
    if ( ! is_dir($system_path)){
        header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
        echo 'Your system folder path does not appear to be set correctly. Please open the following file and correct this: '.pathinfo(__FILE__, PATHINFO_BASENAME);
        exit(3); // EXIT_* constants not yet defined; 3 is EXIT_CONFIG.
    } 
          
/*
 * -------------------------------------------------------------------
 *  Now that we know the path, set the main path constants
 * -------------------------------------------------------------------
 */
	// The name of THIS file
	define('SELF', pathinfo(__FILE__, PATHINFO_BASENAME));

    // Path to the root folder
    define('ROOTPATH', str_replace('\\', '/', $root_path));

    // Path to the system folder
    define('BASEPATH', str_replace('\\', '/', $system_path));

	// Path to the system folder
	define('UPLOADSPATH', str_replace('\\', '/', $uploads_folder));

	// Path to the front controller (this file)
	define('FCPATH', str_replace(SELF, '', __FILE__));

	// Name of the "system folder"
	define('SYSDIR', trim(strrchr(trim(BASEPATH, '/'), '/'), '/'));

	// The path to the "application" folder
	if (is_dir($application_folder))
	{
		if (($_temp = realpath($application_folder)) !== FALSE)
		{
			$application_folder = $_temp;
		}

		define('APPPATH', $application_folder.'/');
	}
	else
	{
		if ( ! is_dir(BASEPATH.$application_folder.'/'))
		{
			header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
			echo 'Your application folder path does not appear to be set correctly. Please open the following file and correct this: '.SELF;
			exit(3); // EXIT_* constants not yet defined; 3 is EXIT_CONFIG.
		}

		define('APPPATH', BASEPATH.$application_folder.'/');
	}

	// The path to the "views" folder
	if ( ! is_dir($view_folder))
	{
		if ( ! empty($view_folder) && is_dir(APPPATH.$view_folder.'/'))
		{
			$view_folder = APPPATH.$view_folder;
		}
		elseif ( ! is_dir(APPPATH.'views/'))
		{
			header('HTTP/1.1 503 Service Unavailable.', TRUE, 503);
			echo 'Your view folder path does not appear to be set correctly. Please open the following file and correct this: '.SELF;
			exit(3); // EXIT_* constants not yet defined; 3 is EXIT_CONFIG.
		}
		else
		{
			$view_folder = APPPATH.'views';
		}
	}

	if (($_temp = realpath($view_folder)) !== FALSE)
	{
		$view_folder = $_temp.'/';
	}
	else
	{
		$view_folder = rtrim($view_folder, '/').'/';
	}

	define('VIEWPATH', $view_folder);

// --------------------------------------------------------------------
// END OF USER CONFIGURABLE SETTINGS.  DO NOT EDIT BELOW THIS LINE
// --------------------------------------------------------------------
                                        
require_once BASEPATH.'core/Felis.php';        

/* End of file index.php */
/* Location: ./index.php */