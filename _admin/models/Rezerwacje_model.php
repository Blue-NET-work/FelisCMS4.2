<?php
class Rezerwacje_model extends CI_Model{

// Budowanie nazw kategorii dla listy podstron
    public function pagesList(){
    	$pages = false;

        foreach($this->db->get("reservation")->result_array() as $key=>$page){

        	$user = $this->ion_auth->user($page["r_uid"])->row();
			$pakiet = $this->db->get_where("pakiet", array("p_id"=>$page["r_pid"]))->row_array();

            $pages[$key] = array("r_id" => $page["r_id"], "r_pid" => $page["r_pid"], "p_name" => $pakiet["p_name"], "u_name" => $user->first_name." ".$user->last_name, "r_status"=>$page["r_status"]);
        }

        return $pages;
    }


}
