<?php
class Articles_model extends CI_Model{

// Budowanie nazw kategorii dla listy podstron
    public function pagesList(){

        foreach($this->db->get("articles")->result_array() as $key=>$page){
            if(element("a_parent_id", $page) != "0"){
        		$position = elements(
        			array('a_id', 'a_name', 'a_alias', 'a_active', 'a_lang', 'a_parent_id', 'a_parent_name', "a_date"), $page,
        			$this->db->select("a_name")->get_where("articles", array("a_id"=>$page["a_parent_id"]))->row("a_name")
        		);
            }
            else{
                $position = elements(array('a_id', 'a_name', 'a_alias', 'a_active', 'a_lang', 'a_parent_id', "a_date"), $page);
            }

            $pages[$key] = $position;
        }

        return $pages;
    }

// Budowanie drzewa podstron
    public function pagesTree(){
        $arr = $this->db->select("a_id, a_name, a_lang, a_parent_id")->order_by("a_id asc, a_lang asc")->get("articles")->result_array();

/*
        foreach($array as $id => $v){

	        if(element("parent_id", $v) == 0){
	        	$tree[element("lang", $v)][] = $v;
	        	print_r($v);
	        }

	        if(element("parent_id", $item) == 0){
	            $tree[element("parent_id", $item)][$id] = &$item;
	        }
            elseif(isset($array[$item['parent_id']])){
                $array[$item['parent_id']]['children'][$id] = &$item;
            }
            else{
                $tree['_orphans_'][$id] = &$item;
            }

        }
*/
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

/*
        printr($tree);
*/
		return $tree;
    }

}
