// Aktywowanie wpisu
$(".actions").on("click", "a.glyphicon-ok", function(event){
    event.preventDefault();
    var id =($(this).attr('data-item'));
    var url = "{$base_url}articles/active.html";

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
                $("#status_"+id).removeClass("glyphicon-ok").addClass("glyphicon-ban-circle").attr("title","{lang line='default_block'}");
            } else{
                notify('{lang line="default_error"}', "{lang line='default_item_active_error'}", {
                    icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
                });
            }
        },
      error: function(){
        notify('{lang line="default_error"}', "{lang line='default_item_active_error'}", {
            icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
        });
      }
    });
});
// .end


// Blokowanie wpisu
$(".actions").on("click", "a.glyphicon-ban-circle", function(event){
    event.preventDefault();
    var id =($(this).attr('data-item'));
    var url = "{$base_url}articles/block.html";

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
                $("#status_"+id).removeClass("glyphicon-ban-circle").addClass("glyphicon-ok").attr("title","{lang line='default_active'}");
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

// Usuwanie wpisu
$('.actions .felisDel').data('confirm-options', {

    onConfirm: function()
    {
        // Remove element
        var url = "{$base_url}articles/del.html",
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
                    notify('{lang line="default_success"}', "{lang line='default_item_delete'}", {
                        icon: '{$TEMPLATES}assets/img/icons/woocons/glyph-check.png'
                    });
                } else{
                    notify('{lang line="default_error"}', "{lang line='default_item_block_delete'}", {
                        icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
                    });
                }
            },
          error: function(){
            notify('{lang line="default_error"}', "{lang line='default_item_block_delete'}", {
                icon: '{$TEMPLATES}assets/img/icons/woocons/stop.png'
            });
          }
        });

        // Prevent default link behavior
        return false;
    }

});
// .end

// Kopiowanie tytułu strony

//.end