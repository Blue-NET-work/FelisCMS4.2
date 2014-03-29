<?php
//
// jQuery File Tree PHP Connector
//
// Version 1.01
//
// Cory S.N. LaViska
// A Beautiful Site (http://abeautifulsite.net/)
// 24 March 2008
//
// History:
//
// 1.01 - updated to work with foreign characters in directory/file names (12 April 2008)
// 1.00 - released (24 March 2008)
//
// Output a list of files for jQuery File Tree
//

$_POST['dir'] = urldecode($_POST['dir']);

//$_POST['dir'] = '/';
define('PATH', realpath('./') . '/');
$root = PATH.'public/gfx/';
echo $root;
$root = 
if( file_exists($root . $_POST['dir']) ) {
	$files = scandir($root . $_POST['dir']);
	natcasesort($files);
	if( count($files) > 2 ) { /* The 2 accounts for . and .. */
		echo "<ul class=\"jqueryFileTree\" style=\"display: none;\">";
		// All dirs
		foreach( $files as $file ) {
			if( file_exists($root . $_POST['dir'] . $file) && $file != '.' && $file != '..' && is_dir($root . $_POST['dir'] . $file) ) {
				echo "<li class=\"directory collapsed\"><a href=\"#\" rel=\"" . htmlentities($_POST['dir'] . $file) . "/\">" . htmlentities($file) . "</a></li>";
			}
		}
		// All files
		foreach( $files as $file ) {
			if( file_exists($root . $_POST['dir'] . $file) && $file != '.' && $file != '..' && !is_dir($root . $_POST['dir'] . $file) ) {
				$ext = preg_replace('/^.*\./', '', $file);
				echo "<li class=\"file ext_$ext\"><a href=\"#\" rel=\"" . htmlentities($_POST['dir'] . $file) . "\">" . htmlentities($file) . "</a></li>";
			}
		}
		echo "</ul>";	
	}
}

//echo '<ul class="jqueryFileTree" style=""><li class="directory collapsed"><a href="#" rel="../../demo/connectors/">connectors</a></li><li class="directory collapsed"><a href="#" rel="../../demo/demo/">demo</a></li><li class="directory collapsed"><a href="#" rel="../../demo/images/">images</a></li><li class="file ext_html"><a href="#" rel="../../demo/index.html">index.html</a></li><li class="file ext_js"><a href="#" rel="../../demo/jquery.easing.js">jquery.easing.js</a></li><li class="file ext_js"><a href="#" rel="../../demo/jquery.js">jquery.js</a></li><li class="file ext_css"><a href="#" rel="../../demo/jqueryFileTree.css">jqueryFileTree.css</a></li><li class="file ext_js"><a href="#" rel="../../demo/jqueryFileTree.js">jqueryFileTree.js</a></li></ul>';

?>