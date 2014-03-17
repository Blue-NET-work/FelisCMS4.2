
   <!-- HTML helper
    ================================================== -->
    <div id="background"></div>
    
    <!-- Skrypty jQ
    ================================================== -->                                  
    {*include file="helpview/jQuery.tpl"*}
                             
    <!-- Scripts -->
    <script src="{$TEMPLATES}assets/js/libs/jquery-1.11.0.js"></script>
    <script src="{$TEMPLATES}assets/js/scripts/setup.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap/bootstrap.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap/bootstrap-jasny.js"></script>

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

    <script src="{$TEMPLATES}assets/js/libs/DataTables/jquery.dataTables.js"></script>
                                                                                         
    <script type="text/javascript">$(".datatable").dataTable({   
        "oLanguage": {
        "sProcessing":   '{lang line="dataTable_sProcessing"}',
        "sLengthMenu":   "{lang line='dataTable_sLengthMenu'}",
        "sZeroRecords":  "{lang line='dataTable_sZeroRecords'}",
        "sInfo":         "{lang line='dataTable_sInfo'}",
        "sInfoEmpty":    "{lang line='dataTable_sInfoEmpty'}",
        "sInfoFiltered": "{lang line='dataTable_sInfoFiltered'}",
        //"sInfoPostFix":  '{lang line="dataTable_sInfoPostFix"}',
        "sSearch":       "{lang line='dataTable_sSearch'}",
        //"sUrl":          "{lang line='dataTable_sUrl'}",
            "oPaginate": {
                "sFirst":    "{lang line='dataTable_sFirst'}",
                "sPrevious": "{lang line='dataTable_sPrevious'}",
                "sNext":     "{lang line='dataTable_sNext'}",
                "sLast":     "{lang line='dataTable_sLast'}"
            }
        }
    });</script>
    <!-- Tinycon -->
    <script src="{$TEMPLATES}assets/js/libs/tinycon.js"></script>
                 
    <script>
    {include file="../js/scripts/felis.function.js"}

                           
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