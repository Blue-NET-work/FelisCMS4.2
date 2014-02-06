<?php

class MDir {
    
    public function openFolder($dir){  
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    echo "filename: $file \n";
                }
                closedir($dh);
            }
        }    
    }    
    
    
    function get_dirs($dir){ 
        global $dirs; 
        if (!isset($dirs)){$dirs = '';} 
        if(substr($dir,-1) !== '\\'){$dir .= '\\';} 
        if ($handle = opendir($dir)){ 
            while (false !== ($file = readdir($handle))){ 
                if (filetype($dir.$file) === 'dir' && $file != "." && $file != ".."){ 
                    clearstatcache(); 
                    $dirs .= $file . "\n"; 
                    self::get_dirs($dir . $file); 
                } 
            } 
            closedir($handle); 
        } 
        return $dirs; 
    } 
      
    
//    
//    
//    
//    
//    
//    
//    
// STARE    
//    
//    
//    
//    
//    
//    
//    

    /**
     *     rekursywne usuwanie folderu
     */
    public static function removeDir($dir, $DeleteMe=false) {
        if (!is_dir($dir) || !$dh = opendir($dir))
            return;
        while (false !== ($obj = readdir($dh))) {
            if ($obj == '.' || $obj == '..')
                continue;
            if (!@unlink($dir . '/' . $obj))
                self::removeDir($dir . '/' . $obj, true);
        }
        if ($DeleteMe) {
            closedir($dh);
            @rmdir($dir);
        }
    }

    /**
     *     sprawdza czy istnieje folder, jeśli nie to próbuje go utworzyć
     *     @return bool - true jesli folder istnieje, true/false jesli probuje go utworzyc
     */
    public static function existOrMakeDir($dir, $chmod=0777) {
        if (is_dir($dir)) {
            return true;
        } else {
            $result = @mkdir($dir, $chmod, true);
            chmod($dir, $chmod);
            return $result;
        }
    }

    /**
     *     kopiowanie struktury katalogów
     */
    public static function full_copy($source, $target) {
        if (is_dir($source)) {
            if (!is_dir($target)) {
                mkdir($target);
            }
            $output = shell_exec("chmod -R 777 {$target}");
            //echo $output."<br>";
            @chmod($target, 0777);
            $d = dir($source);

            while (FALSE !== ( $entry = $d->read() )) {
                if ($entry == '.' || $entry == '..') {
                    continue;
                }

                $Entry = $source . '/' . $entry;
                if (is_dir($Entry)) {
                    self::full_copy($Entry, $target . '/' . $entry);
                    continue;
                }
                copy($Entry, $target . '/' . $entry);
            }

            $d->close();
        } else {
            copy($source, $target);
        }
    }
    
    public function rrmdir($dir) {
        if (is_dir($dir)) {
            $objects = scandir($dir);
            foreach ($objects as $object) {
                if ($object != "." && $object != "..") {
                    if (filetype($dir."/".$object) == "dir") rrmdir($dir."/".$object); else unlink($dir."/".$object);
                }
            }
            reset($objects);
            rmdir($dir);
        }
    }
}