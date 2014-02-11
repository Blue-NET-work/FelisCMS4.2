<?php

  $config['chmodFelis_tmp'] = array(     
    array("folder"=>"tmp", "chmod"=>"777"),
    array("folder"=>"tmp/cache", "chmod"=>"777"),
    array("folder"=>"tmp/logs", "chmod"=>"777"),
    array("folder"=>"tmp/templates", "chmod"=>"777")
  );

  $config['chmodFelis_uploads'] = array(        
    array("folder"=>"uploads", "chmod"=>"777"),
    array("folder"=>"uploads/avatar", "chmod"=>"777"),
    array("folder"=>"uploads/gallery", "chmod"=>"777")
  );
  
  
  $config['chmodFelis'] = array_merge($config['chmodFelis_tmp'], $config['chmodFelis_uploads']);