<?php
require_once(BASEPATH."modules/wideimage/WideImage.php");

class Hotels_model extends CI_Model{

// Budowanie nazw kategorii dla listy podstron
    public function pagesList(){

        foreach($this->db->get("hotels")->result_array() as $key=>$page){

        	$position = elements(array('id', 'name', 'active'), $page);

            $pages[$key] = $position;
        }

        return $pages;
    }

// Budowanie drzewa podstron
    public function pagesTree(){
        $arr = $this->db->select("a_id, a_name, a_lang, a_parent_id")->order_by("a_id asc, a_lang asc")->get("articles")->result_array();

        return $this->__pagePosition($arr);
    }

/*
 *
 *	Prywatne funkcje modelu
 *
 */

// Funkcja grupowania
    private function __pagePosition($array, $parent_id = 0, $lang = false){

        foreach($array as $item){
			$tree[element("a_id", $item)] = $item;
        }
		return $tree;
    }


// Dodawanie zdjęcia
    public function uploadFotoAction($id, $options = false){
        if (isset($options['file']) && is_file($options['file'])) {
            $path = ROOTPATH . "uploads/images/hotels";
            MDir::existOrMakeDir($path);
            $title = isset($options['title']) ? $options['title'] : '';
            $alt = isset($options['alt']) ? $options['alt'] : '';
            $filename = str_replace(" ","_",$options['filename']);
            $zdjecie = pathinfo($filename, PATHINFO_FILENAME);
            $ext = pathinfo($filename, PATHINFO_EXTENSION);
            $forg = "{$path}/org/{$filename}";
            if(is_file($forg)){$zdjecie = time();}
            $filename = $zdjecie.".".$ext;
            $table = $this->db->dbprefix("hotels_photo");
            $kolejnosc = $this->db->query("SELECT MAX(`hp_sort`) FROM `{$table}` WHERE `hp_parent_id` = {$id}");
            $kolejnosc = intval($kolejnosc->row('MAX(`hp_sort`)'));
            $kolejnosc++;
            $image = WideImage::load($options['file']);
            $white = $image->allocateColor(255, 255, 255);
            //miniaturka 1
            $image->resize(70, 70, 'outside')->resizeCanvas(70, 70, 'center', 'center', $white)->saveToFile("{$path}/thumb_70/{$filename}");
            //miniaturka 2
            $image->resize(120, 120, 'outside')->resizeCanvas(120, 120, 'center', 'center', $white)->saveToFile("{$path}/thumb_120/{$filename}");
            //miniaturka 3
            $image->resize(200, 150, 'outside')->resizeCanvas(200, 150, 'center', 'center', $white)->saveToFile("{$path}/thumb_200/{$filename}");
            //miniaturka 4
            $image->resize(280, 200, 'outside')->resizeCanvas(280, 200, 'center', 'center', $white)->saveToFile("{$path}/thumb_280/{$filename}");
            //miniaturka 5
            $image->resize(300, 200, 'outside')->resizeCanvas(300, 200, 'center', 'center', $white)->saveToFile("{$path}/thumb_300/{$filename}");
            //miniaturka 6
            $image->resize(450, 300, 'outside')->resizeCanvas(450, 300, 'center', 'center', $white)->saveToFile("{$path}/thumb_450/{$filename}");
            //miniaturka 7
            $image->resize(735, 300, 'outside')->resizeCanvas(735, 300, 'center', 'center', $white)->saveToFile("{$path}/thumb_735/{$filename}");
            $image->resize(800, 600, 'outside')->resizeCanvas(800, 600, 'center', 'center', $white)->saveToFile("{$path}/thumb_800/{$filename}");
            //miniaturka 8
            $image->resize(900, 500, 'outside')->resizeCanvas(900, 500, 'center', 'center', $white)->saveToFile("{$path}/thumb_900/{$filename}");
            //oryginal
            $image->saveToFile("{$path}/org/{$filename}");
	        $data = array('hp_id' => 'NULL', 'hp_photo' => $zdjecie, 'hp_ext'=>$ext, 'hp_parent_id' => $id, 'hp_sort' => $kolejnosc, 'hp_alt' => $alt, 'hp_title' => $title);
	        $query = @FC_DB::insert('hotels_photo', $data);
            $message = $query;
        }

    }
// Dodawanie zdjęć
    public function serverFotoAction($id, $options = false){
        $path = ROOTPATH . "uploads/images/hotels";
        MDir::existOrMakeDir($path);
        // pobierani danych
        $title = isset($options['title']) ? $options['title'] : '';
        $alt = isset($options['alt']) ? $options['alt'] : '';
        $filename = $options['file'];
        $filename=str_replace(" ","_",$filename);
        $zdjecie = pathinfo($filename, PATHINFO_FILENAME);
        $ext = pathinfo($filename, PATHINFO_EXTENSION);
        //Sortowanie zdjęcia
        $table = $this->db->dbprefix("hotels_photo");
        $kolejnosc = $this->db->query("SELECT MAX(`hp_sort`) FROM `{$table}` WHERE `hp_parent_id` = {$id}");
        $kolejnosc = intval($kolejnosc->row('MAX(`hp_sort`)'));
        $kolejnosc++;
        // Funkcja zapisu foto na ftp
        $image = WideImage::load($options['file']);
        $white = $image->allocateColor(255, 255, 255);
        //miniaturka 1
        $image->resize(70, 70, 'outside')->resizeCanvas(70, 70, 'center', 'center', $white)->saveToFile("{$path}/thumb_70/{$zdjecie}.{$ext}");
        //miniaturka 2
        $image->resize(120, 120, 'outside')->resizeCanvas(120, 120, 'center', 'center', $white)->saveToFile("{$path}/thumb_120/{$zdjecie}.{$ext}");
        //miniaturka 3
        $image->resize(200, 150, 'outside')->resizeCanvas(200, 150, 'center', 'center', $white)->saveToFile("{$path}/thumb_200/{$zdjecie}.{$ext}");
        //miniaturka 4
        $image->resize(280, 200, 'outside')->resizeCanvas(280, 200, 'center', 'center', $white)->saveToFile("{$path}/thumb_280/{$zdjecie}.{$ext}");
        //miniaturka 5
        $image->resize(300, 200, 'outside')->resizeCanvas(300, 200, 'center', 'center', $white)->saveToFile("{$path}/thumb_300/{$zdjecie}.{$ext}");
        //miniaturka 6
        $image->resize(450, 300, 'outside')->resizeCanvas(450, 300, 'center', 'center', $white)->saveToFile("{$path}/thumb_450/{$zdjecie}.{$ext}");
        //miniaturka 7
        $image->resize(735, 300, 'outside')->resizeCanvas(735, 300, 'center', 'center', $white)->saveToFile("{$path}/thumb_735/{$zdjecie}.{$ext}");
        $image->resize(800, 600, 'outside')->resizeCanvas(800, 600, 'center', 'center', $white)->saveToFile("{$path}/thumb_800/{$zdjecie}.{$ext}");
        //miniaturka 8
        $image->resize(900, 500, 'outside')->resizeCanvas(900, 500, 'center', 'center', $white)->saveToFile("{$path}/thumb_900/{$zdjecie}.{$ext}");
        //oryginal
        $image->saveToFile("{$path}/org/{$zdjecie}.{$ext}");
        // Dodanie wpisu do DB
        $data = array('hp_id' => 'NULL', 'hp_photo' => $zdjecie, 'hp_ext'=>$ext, 'hp_parent_id' => $id, 'hp_sort' => $kolejnosc, 'hp_alt' => $alt, 'hp_title' => $title);
        $query = @FC_DB::insert('hotels_photo', $data);
        $message = $query;
    }



}
