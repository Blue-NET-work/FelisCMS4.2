<?php
                                                              
function smarty_function_breadcrumbs($params, $template) { 
                               
        $html = "";                   
        $CI =& get_instance();   
        
        // load Breadcrumbs
        $CI->load->library('breadcrumbs');

        // add breadcrumbs                                         
        $CI->breadcrumbs->_array($params['array']);
                         
        // unshift crumb
        if(!$params['home']) $params['home'] = "Home";
        
        $CI->breadcrumbs->unshift($params['home'], site_url(''));   
           
        return stripslashes($CI->breadcrumbs->show());
}
