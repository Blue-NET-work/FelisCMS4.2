<?php

function smarty_function_minyfy($params, $template) {

    $html="";

	$this->ci =& get_instance();

	if($params["type"] == "CSS"){
		$html .= $this->minify->deploy_css(true);
	}
	if($params["type"] == "jQ"){
		$html .= $this->minify->deploy_js(true);
	}

    return stripslashes($html);
}