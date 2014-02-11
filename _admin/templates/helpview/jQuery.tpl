
{jquery style=$_JQ}    
                                                                                     
    <script>         
    {if $messages}                    
        notify("{$messages.head}", '{$messages.info}',{
            icon: "{$base_url}public/img/icons/coquette/48x48/{$messages.icon}"   
        });   
    {/if}                       
    
    {include file="helpview/assets/function.js"}                                                                                   
    </script>                                          