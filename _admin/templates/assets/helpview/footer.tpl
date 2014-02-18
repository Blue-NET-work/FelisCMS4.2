 
    <!-- Button to open/hide menu -->
    <a href="#" id="open-menu"><span>{lang line="default_sidebar_menu"}</span></a>
 
   <!-- Sidebar
    ================================================== -->                                 
    {include file="./sidebar.tpl"}  

   <!-- HTML helper
    ================================================== -->
    <div id="background"></div>
    
    <!-- Skrypty jQ
    ================================================== -->                                  
    {*include file="helpview/jQuery.tpl"*}
                             
    <!-- Scripts -->
    <script src="{$TEMPLATES}assets/js/libs/jquery-1.11.0.js"></script>
    <script src="{$TEMPLATES}assets/js/setup.js"></script>

    <!-- Template functions -->
    <script src="{$TEMPLATES}assets/js/felis/felis.input.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.message.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.modal.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.navigable.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.notify.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.scroll.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.progress-slider.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.tooltip.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.confirm.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.agenda.js"></script>
    <script src="{$TEMPLATES}assets/js/felis/felis.tabs.js"></script>        <!-- Must be loaded last -->

    <!-- Tinycon -->
    <script src="{$TEMPLATES}assets/js/libs/tinycon.js"></script>
    
    
    <script>

        // Call template init (optional, but faster if called manually)
        $.template.init();

        // Favicon count
        Tinycon.setBubble(2);

        // If the browser support the Notification API, ask user for permission (with a little delay)
        if (notify.hasNotificationAPI() && !notify.isNotificationPermissionSet()){
            setTimeout(function(){
                notify.showNotificationPermission('Your browser supports desktop notification, click here to enable them.', function(){
                    // Confirmation message
                    if (notify.hasNotificationPermission())
                    {
                        notify('Notifications API enabled!', 'You can now see notifications even when the application is in background', {
                            icon: 'img/demo/icon.png',
                            system: true
                        });
                    }
                    else
                    {
                        notify('Notifications API disabled!', 'Desktop notifications will not be used.', {
                            icon: 'img/demo/icon.png'
                        });
                    }
                });

            }, 2000);
        }
                           
        // Delete button
        $('.list .button-group a:last-child').data('confirm-options', {

            onShow: function()
            {
                // Remove auto-hide class
                $(this).parent().removeClass('show-on-parent-hover');
            },

            onConfirm: function()
            {
                // Remove element
                $(this).closest('li').fadeAndRemove();

                // Prevent default link behavior
                return false;
            },

            onRemove: function()
            {
                // Restore auto-hide class
                $(this).parent().addClass('show-on-parent-hover');
            }

        });
                
            

        /*
         * Agenda scrolling
         * This example shows how to remotely control an agenda. most of the time, the built-in controls
         * using headers work just fine
         */

            // Days
        var daysName = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],

            // Name display
            agendaDay = $('#agenda-day'),

            // Agenda scrolling
            agenda = $('#agenda').scrollAgenda({
                first: 2,
                onRangeChange: function(start, end)
                {
                    if (start != end)
                    {
                        agendaDay.text(daysName[start].substr(0, 3)+' - '+daysName[end].substr(0, 3));
                    }
                    else
                    {
                        agendaDay.text(daysName[start]);
                    }
                }
            });

        // Remote controls
        $('#agenda-previous').click(function(event)
        {
            event.preventDefault();
            agenda.scrollAgendaToPrevious();
        });
        $('#agenda-today').click(function(event)
        {
            event.preventDefault();
            agenda.scrollAgendaFirstColumn(2);
        });
        $('#agenda-next').click(function(event)
        {
            event.preventDefault();
            agenda.scrollAgendaToNext();
        });                        

    </script>