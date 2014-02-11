// Aktywowanie wpisu   
    $(".actions").on("click", "a.coquette16-accept", function(event){  
        event.preventDefault();
        var id =($(this).attr('data-item'));
        var url = "{$base_url}users/active.html";
                        
        $.ajax({
            url: url,
            type: "POST",
            dataType: 'json',
            data: {
                "date[id]":id
            },  
            success: function(response) {
                //console.log(response);  
                if (response.status == 'ok') {                                   
                    notify('{lang line="default_success"}', "{lang line='users_active_success'}", {
                        icon: '{$base_url}public/img/icons/coquette/48x48/accept.png'
                    });   
                    $("#status_"+id).removeClass("coquette16-accept").addClass("coquette16-block").attr("title","{lang line='default_block'}");                                   
                } else{                                     
                    notify('{lang line="default_error"}', "{lang line='users_active_error'}", {
                        icon: '{$base_url}public/img/icons/coquette/48x48/warning.png'
                    });   
                }     
            },
          error: function(){                                  
            notify('{lang line="default_error"}', "{lang line='users_active_error'}", {
                icon: '{$base_url}public/img/icons/coquette/48x48/warning.png'
            });  
          }
        });                     
    });   
// .end 


// Blokowanie wpisu   
    $(".actions").on("click", "a.coquette16-block", function(event){  
        event.preventDefault();
        var id =($(this).attr('data-item'));
        var url = "{$base_url}users/block.html";
                   
        $.ajax({
            url: url,
            type: "POST",
            dataType: 'json',
            data: {
                "date[id]":id
            },  
            success: function(response) {
                //console.log(response);  
                if (response.status == 'ok') {                                   
                    notify('{lang line="default_success"}', "{lang line='users_block_success'}", {
                        icon: '{$base_url}public/img/icons/coquette/48x48/accept.png'
                    });   
                    $("#status_"+id).removeClass("coquette16-block").addClass("coquette16-accept").attr("title","{lang line='default_active'}");                                 
                } else{                                     
                    notify('{lang line="default_error"}', "{lang line='users_block_error'}", {
                        icon: '{$base_url}public/img/icons/coquette/48x48/warning.png'
                    });   
                }     
            },
          error: function(){                                  
            notify('{lang line="default_error"}', "{lang line='users_block_error'}", {
                icon: '{$base_url}public/img/icons/coquette/48x48/warning.png'
            });  
          }
        });                     
    });   
// .end 


$('.actions .felisDel').data('confirm-options', {  
                                 
    onConfirm: function()    
    {                                            
        // Remove element
        var url = "{$base_url}users/del.html",
            idItem = $(this).attr("data-item"),
            thisTr = $(this).closest('tr'); 
            
        $.ajax({
            url: url,
            type: "POST",
            dataType: 'json',
            data: {
                "date[id]":idItem
            },  
            success: function(response) {
                //console.log(response);  
                if (response.status == 'ok') {           
                    thisTr.fadeAndRemove(),                                
                    notify('{lang line="default_success"}', "{lang line='users_delete_success'}", {
                        icon: '{$base_url}public/img/icons/coquette/48x48/accept.png'
                    });                                                                   
                } else{                                     
                    notify('{lang line="default_error"}', "{lang line='users_delete_error'}", {
                        icon: '{$base_url}public/img/icons/coquette/48x48/warning.png'
                    });   
                }     
            },
          error: function(){                                  
            notify('{lang line="default_error"}', "{lang line='users_delete_error'}", {
                icon: '{$base_url}public/img/icons/coquette/48x48/warning.png'
            });  
          }
        });   
                              
        // Prevent default link behavior
        return false;
    }

});         