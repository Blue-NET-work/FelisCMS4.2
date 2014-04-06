// Aktywowanie wpisu
    $(".actions").on("click", "a.glyphicon-ok-circle", function(event){
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
	                notify('{lang line="default_success"}', "{lang line='default_item_active'}", {
	                    icon: '{$TEMPLATES}assets/img/icons/woocons/glyph-check.png'
	                });
	                $("#r_status"+id).html('<span class="label label-success">Zatwierdzona</span>');
	            } else{
	                notify('{lang line="default_error"}', "{lang line='default_item_active_error'}", {
	                    icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
	                });
	            }
            },
          error: function(){
	        notify('{lang line="default_error"}', "{lang line='default_item_block_error'}", {
	            icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
	        });
          }
        });
    });
// .end


// Blokowanie wpisu
    $(".actions").on("click", "a.glyphicon-remove-circle", function(event){
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
	                notify('{lang line="default_success"}', "{lang line='default_item_block'}", {
	                    icon: '{$TEMPLATES}assets/img/icons/woocons/glyph-check.png'
	                });
	                $("#r_status"+id).html('<span class="label label-danger">Odrzucona</span>');
	            } else{
	                notify('{lang line="default_error"}', "{lang line='default_item_block_error'}", {
	                    icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
	                });
	            }
            },
          error: function(){
	        notify('{lang line="default_error"}', "{lang line='default_item_block_error'}", {
	            icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
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
	                    icon: '{$TEMPLATES}assets/img/icons/woocons/glyph-check.png'
                    });
                } else{
                    notify('{lang line="default_error"}', "{lang line='users_delete_error'}", {
	            icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
                    });
                }
            },
          error: function(){
            notify('{lang line="default_error"}', "{lang line='users_delete_error'}", {
	            icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
            });
          }
        });

        // Prevent default link behavior
        return false;
    }

});