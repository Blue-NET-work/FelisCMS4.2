<?php                     
class Control extends CI_Model{
    
    public function __construct(){
        parent::__construct();   
    }     
    
    private static $_css = array();
    private static $_jq = array();
    
    /**
     * przygotowanie tablicy stylu CSS
     */
    function setCSS($data, $type = false, $media = false) {
        $this->_css[] = array("href"=>$data, "type"=>$type, "media"=> $media);
    }
    
    /**
     * przygotowanie tablicy stylu jQuery
     */
    function setJQ($src, $type = false) {
        $this->_jq[] = array("src"=>$src, "type"=>$type);
    }
    
    /**
     * przygotowanie tablicy stylu jQuery
     */
    public function gets() {
        $jq = $this->_jq;
        $css = $this->_css;
        
        if($css) $this->smarty->assign("_CSS", $css);
        if($jq)  $this->smarty->assign("_JQ", $jq);
    }
    
}
