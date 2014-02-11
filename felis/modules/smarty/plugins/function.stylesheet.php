<?php
                                                              
function smarty_function_stylesheet($params, $template) {   
               
        $html=""; 
           
        foreach($params["style"] as $row){
            $html .= "    <link rel='stylesheet' href='{$row["href"]}'"; if($row["type"])$html .=" type='{$row["type"]}'"; if($row["media"]) $html .=" media='{$row["media"]}'"; $html .=">\n";
        }
           
        return stripslashes($html);
}

                                                       