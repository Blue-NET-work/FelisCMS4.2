<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
require_once(BASEPATH.'modules/smarty/Smarty.class.php');       

class FC_Smarty extends Smarty {
     
    function __construct(){
        parent::__construct();
        
        $ci =& get_instance();
        $ci->load->config('smarty');
        $ci->load->helper('url');    
                                            
        // Definiowanie                              
        if($ci->config->item('smarty_templates')) 
            $templates_folder = VIEWPATH."{$ci->config->item('smarty_templates')}/"; 
        else 
            $templates_folder = VIEWPATH;  
                                      
        //$this->debugging = $ci->config->item('smarty_debugging');
        $this->force_compile = $ci->config->item('smarty_force_compile');
        $this->caching = $ci->config->item('smarty_cache');
        $this->caching = $ci->config->item('smarty_cache');
        $this->cache_lifetime = $ci->config->item('smarty_cache_lifetime');
        
        $this->cache_dir = ROOTPATH."tmp/cache/"; 
        $this->compile_dir = ROOTPATH."tmp/".$ci->config->item('smarty_templates_c'); 
        $this->template_dir = $templates_folder;
        
        $this->assign('APPPATH', APPPATH);
        $this->assign('BASEPATH', BASEPATH);
        $this->assign( 'ver', FelisCMS_VERSION );  
        $this->assign('TEMPLATES', $ci->config->templates_url($ci->config->item('smarty_templates'))); 
        $this->assign('uploads', $ci->config->uploads_url()); 
        $this->assign('uploads_images', $ci->config->uploads_url("images")); 
        $this->assign('base_url', $ci->config->base_url());   
        $this->assign('root_url', $ci->config->root_url());   
        $this->assign('system_url', $ci->config->system_url());   
        $this->left_delimiter  = '{'; 
        $this->right_delimiter = '}';
        $this->error_reporting = 'E_ALL ^ E_NOTICE'; 

        // Assign CodeIgniter object by reference to CI
        if(method_exists( $this, 'assignByRef')){$this->assignByRef("ci", $ci);}

        log_message('debug', "Smarty Class Initialized");
    }


    /**
     *  Parse a template using the Smarty engine
     *
     * This is a convenience method that combines assign() and
     * display() into one step. 
     *
     * Values to assign are passed in an associative array of
     * name => value pairs.
     *
     * If the output is to be returned as a string to the caller
     * instead of being output, pass true as the third parameter.
     *
     * @access    public
     * @param    string
     * @param    array
     * @param    bool
     * @return    string
     */
    function view($template, $data = array(), $return = FALSE){
           
        foreach ($data as $key => $val){self::assign($key, $val);}
        
        if ($return == FALSE){
            $CI =& get_instance();
            if(method_exists($CI->output, 'set_output')){$CI->output->set_output(self::fetch($template));}
            else{$CI->output->final_output = self::fetch($template);}
            return;
        }
        
        else {return self::fetch($template);}
    }    
    
    function viewReturn($template, $data = array(), $return = TRUE){
           
        foreach ($data as $key => $val){self::assign($key, $val);}
        
        if ($return == FALSE){
            $CI =& get_instance();
            if(method_exists($CI->output, 'set_output')){$CI->output->set_output(self::fetch($template));}
            else{$CI->output->final_output = self::fetch($template);}
            return;
        }
        
        else {return self::fetch($template);}
    }    
    
    public function assigns($class, $data){self::assign($class, $data);}
}
// END Smarty Class