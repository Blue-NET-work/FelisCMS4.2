<?php
                                                              
function smarty_function_jquery($params, $template) {   
               
        $html=""; 
           
        foreach($params["style"] as $row){
            $html .= "    <script src='{$row["src"]}'"; if($row["type"])$html .=" type='{$row["type"]}'"; $html .="></script>\n";
        }
           
        return stripslashes($html);
}

                                                       