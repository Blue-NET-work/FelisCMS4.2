<?php
class Pages_model extends CI_Model{

// Budowanie nazw kategorii dla listy podstron
    public function pagesList(){

        foreach($this->db->get("pages")->result_array() as $key=>$page){
            if(element("parent_id", $page) != "0"){
        		$position = elements(
        			array('id', 'name', 'alias', 'active', 'lang', 'parent_id', 'parent_name'), $page,
        			$this->db->select("name")->get_where("pages", array("id"=>$page["parent_id"]))->row("name")
        		);
            }
            else{
                $position = elements(array('id', 'name', 'alias', 'active', 'lang', 'parent_id'), $page);
            }

            $pages[$key] = $position;
        }

        return $pages;
    }

// Budowanie drzewa podstron
    public function pagesTree(){
        $arr = $this->db->select("id, name, lang, parent_id")->order_by("id asc, lang asc")->get("pages")->result_array();

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
			$tree[element("id", $item)] = $item;
        }

/*
        printr($tree);
*/
		return $tree;
    }

}
