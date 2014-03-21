    // Call template init (optional, but faster if called manually)
    $.template.init();

    // Favicon count
    Tinycon.setBubble(2);

    // If the browser support the Notification API, ask user for permission (with a little delay)
    if (notify.hasNotificationAPI() && !notify.isNotificationPermissionSet()){
        setTimeout(function(){
            notify.showNotificationPermission('{lang line="felis_info_api_chrome"}', function(){
                // Confirmation message
                if (notify.hasNotificationPermission())
                {
                    notify('{lang line="felis_info_api_chrome_enable"}', '{lang line="felis_info_api_chrome_enable_info"}', {
                        icon: '{$TEMPLATES}assets/img/demo/icon.png',
                        system: true
                    });
                }
                else
                {
                    notify('{lang line="felis_info_api_chrome_disabled"}', '{lang line="felis_info_api_chrome_disabled"}', {
                        icon: '{$TEMPLATES}assets/img/demo/icon.png'
                    });
                }
            });

        }, 2000);
    }


// Przetwarzanie nazwy na alias
$(".FelisNazwa").on('change', function(){
    $("#FelisAlias").show();
	var id = $(".FelisNazwa").val();
    $.ajax({
        url: "{$base_url}ajax/url_title.html",
        type: "POST",
        dataType: 'json',
        data: {
            "post_title":id
        },
        success: function(response) {
    		$("#FelisAlias").hide();
            $(".FelisAlias").val(response);
        }
    });
});
// .end

// Generowanie podglądu strony
$(".preview").on("click", function(){
    var url = $(this).attr('data-href'),
        urlTitle = $(this).attr('data-title'),
        titleSite = "";
        if(urlTitle) {
            titleSite = " - "+ urlTitle
        }
    $.modal({
        title: 'FelisCMS 4 - {lang line="default_sidebar_access_preview"}'+ titleSite,
        url: url,
        maxWidth: $(window).width()-150,
        height: $(window).height()-100,
        useIframe: true
    });
});
// .end