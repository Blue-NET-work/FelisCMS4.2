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
                        icon: 'img/demo/icon.png',
                        system: true
                    });
                }
                else
                {
                    notify('{lang line="felis_info_api_chrome_disabled"}', '{lang line="felis_info_api_chrome_disabled"}', {
                        icon: 'img/demo/icon.png'
                    });
                }
            });

        }, 2000);
    }