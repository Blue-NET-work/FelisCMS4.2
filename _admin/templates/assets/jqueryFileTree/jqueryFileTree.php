<?php
    $root_path = '../../../../';
    // Set the current directory correctly for CLI requests
    if (defined('ROOTDIN'))
    {
        chdir(dirname(__FILE__));
    }

    if (realpath($root_path) !== FALSE)
    {
        $root_path = realpath($root_path).'/';
    }

    // ensure there's a trailing slash
    $root_path = rtrim($root_path, '/').'/';

    // Is the system path correct?
    if ( ! is_dir($root_path))
    {
        exit("Your system folder path does not appear to be set correctly. Please open the following file and correct this: ".pathinfo(__FILE__, PATHINFO_BASENAME));
    }
    
    // Path to the root folder
    define('ROOTPATH', str_replace("\\", "/", $root_path));
    
$_POST['dir'] = urldecode($_POST['dir']);
$root = $_SERVER["DOCUMENT_ROOT"];
$root = ROOTPATH.'uploads/';

/*
//skanowanie i zmaiana nazw
if( file_exists($root . $_POST['dir']) ) {
    $files = scandir($root . $_POST['dir']);
    natcasesort($files);
    if( count($files) > 2 ) { 
        //zmiana nazw        
        foreach( $files as $file ) {
            if(file_exists($root . $_POST['dir'] . $file) && $file != '.' && $file != '..' && !is_dir($root . $_POST['dir'] . $file) ) {
                $a = array('ą','ć','ę','ł','ń','ó','ś','ź','ż','Ą','Ć','Ę','Ł','Ń','Ó','Ś','Ź','Ż',' ','JPG','/','*','&','$','@','!','#','%20','\"');
                $b = array('a','c','e','l','n','o','s','z','z','A','C','E','L','N','O','S','Z','Z','-','jpg','-','-','-','-','-','-','-','-','-');
                //$name = str_replace($a, $b, $file);
                //$name = strtr($file, 'ąśźĄŚŹł', 'ąśźĄŚŹl');
                // zastosowanie
                $name=plCharset($file, WIN1250_TO_UTF8);
                $name = str_replace($a, $b, $name);
                //echo $name."<br />";
                rename($root . $_POST['dir'].$file, $root . $_POST['dir'].$name);
                //echo $root . $_POST['dir'].$file.'<br />';
            }
        }      
    }
}
*/

//wyswietlanie

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
                $path_parts = pathinfo($root . $_POST['dir'] . $file);
                echo "<li class=\"file ext_$ext\"><a href=\"#\" rel=\"" . htmlentities($root . $_POST['dir'] . $file) . "\" link=\"/uploads" . htmlentities($_POST['dir'] . $file) . "\" >" . htmlentities($file) . "</a></table></li>";
            }
        }
        echo "</ul>";    
    }
}
// funkcje konwersji
function plCharset($string, $type = ISO88592_TO_UTF8) {

    $win2utf = array(
      "\xb9" => "\xc4\x85", "\xa5" => "\xc4\x84",
      "\xe6" => "\xc4\x87", "\xc6" => "\xc4\x86",
      "\xea" => "\xc4\x99", "\xca" => "\xc4\x98",
      "\xb3" => "\xc5\x82", "\xa3" => "\xc5\x81",
      "\xf3" => "\xc3\xb3", "\xd3" => "\xc3\x93",
      "\x9c" => "\xc5\x9b", "\x8c" => "\xc5\x9a",
      "\xbf" => "\xc5\xbc", "\x8f" => "\xc5\xb9",
      "\x9f" => "\xc5\xba", "\xaf" => "\xc5\xbb",
      "\xf1" => "\xc5\x84", "\xd1" => "\xc5\x83",
      "'"   => "", "JPG"=>"jpg", " "=>""
    );
    $iso2utf = array(
      "\xb1" => "\xc4\x85", "\xa1" => "\xc4\x84",
      "\xe6" => "\xc4\x87", "\xc6" => "\xc4\x86",
      "\xea" => "\xc4\x99", "\xca" => "\xc4\x98",
      "\xb3" => "\xc5\x82", "\xa3" => "\xc5\x81",
      "\xf3" => "\xc3\xb3", "\xd3" => "\xc3\x93",
      "\xb6" => "\xc5\x9b", "\xa6" => "\xc5\x9a",
      "\xbc" => "\xc5\xba", "\xac" => "\xc5\xb9",
      "\xbf" => "\xc5\xbc", "\xaf" => "\xc5\xbb",
      "\xf1" => "\xc5\x84", "\xd1" => "\xc5\x83"
    );

    if ($type == ISO88592_TO_UTF8)
      return strtr($string, $iso2utf);
    if ($type == UTF8_TO_ISO88592)
      return strtr($string, array_flip($iso2utf));
    if ($type == WIN1250_TO_UTF8)
      return strtr($string, $win2utf);
    if ($type == UTF8_TO_WIN1250)
      return strtr($string, array_flip($win2utf));
    if ($type == ISO88592_TO_WIN1250)
      return strtr($string, "\xa1\xa6\xac\xb1\xb6\xbc",
        "\xa5\x8c\x8f\xb9\x9c\x9f");
    if ($type == WIN1250_TO_ISO88592)
      return strtr($string, "\xa5\x8c\x8f\xb9\x9c\x9f",
        "\xa1\xa6\xac\xb1\xb6\xbc");
  }
?>