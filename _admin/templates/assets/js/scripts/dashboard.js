       
        /*
         * Handling of 'other actions' menu
         */

        var otherActions = $('#otherActions'),
            current = false;

        // Other actions
        $('.list .button-group a:nth-child(2)').menuTooltip('Loading...', {

            classes: ['with-mid-padding'],
            ajax: 'ajax-style/tooltip-content.html',

            onShow: function(target)
            {
                // Remove auto-hide class
                target.parent().removeClass('show-on-parent-hover');
            },

            onRemove: function(target)
            {
                // Restore auto-hide class
                target.parent().addClass('show-on-parent-hover');
            }
        });

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

        // Demo modal
        function openModal()
        {
            $.modal({
                content: '<p>This is an example of modal window. You can open several at the same time (click links below!), move them and resize them.</p>'+
                          '<p>The plugin provides several other functions to control them, try below:</p>'+
                          '<ul class="simple-list with-icon">'+
                          '    <li><a href="#" onclick="openModal()">Open new blocking modal</a></li>'+
                          '    <li><a href="#" onclick="$.modal.alert(\'This is a non-blocking modal, you can switch between me and the other modal\', { blocker: false })">Open non-blocking modal</a></li>'+
                          '    <li><a href="#" onclick="$(this).getModalWindow().setModalTitle(\'\')">Remove title</a></li>'+
                          '    <li><a href="#" onclick="$(this).getModalWindow().setModalTitle(\'New title\')">Change title</a></li>'+
                          '    <li><a href="#" onclick="$(this).getModalWindow().loadModalContent(\'ajax-style/auto-setup.html\')">Load Ajax content</a></li>'+
                          '</ul>',
                title: 'Example modal window',
                width: 300,
                scrolling: false,
                actions: {
                    'Close' : {
                        color: 'red',
                        click: function(win) { win.closeModal(); }
                    },
                    'Center' : {
                        color: 'green',
                        click: function(win) { win.centerModal(true); }
                    },
                    'Refresh' : {
                        color: 'blue',
                        click: function(win) { win.closeModal(); }
                    },
                    'Abort' : {
                        color: 'orange',
                        click: function(win) { win.closeModal(); }
                    }
                },
                buttons: {
                    'Close': {
                        classes:    'huge blue-gradient glossy full-width',
                        click:        function(win) { win.closeModal(); }
                    }
                },
                buttonsLowPadding: true
            });
        };

        // Demo alert
        function openAlert()
        {
            $.modal.alert('This is an alert message', {
                buttons: {
                    'Thanks, captain obvious': {
                        classes:    'huge blue-gradient glossy full-width',
                        click:        function(win) { win.closeModal(); }
                    }
                }
            });
        };

        // Demo prompt
        function openPrompt()
        {
            var cancelled = false;

            $.modal.prompt('Please enter a value between 5 and 10:', function(value)
            {
                value = parseInt(value);
                if (isNaN(value) || value < 5 || value > 10)
                {
                    $(this).getModalContentBlock().message('Please enter a correct value', { append: false, classes: ['red-gradient'] });
                    return false;
                }

                $.modal.alert('Value: <strong>'+value+'</strong>');

            }, function()
            {
                if (!cancelled)
                {
                    $.modal.alert('Oh, come on....');
                    cancelled = true;
                    return false;
                }
            });
        };

        // Demo confirm
        function openConfirm()
        {
            $.modal.confirm('Challenge accepted?', function()
            {
                $.modal.alert('Me gusta!');

            }, function()
            {
                $.modal.alert('Meh.');
            });
        };
         

        // Demo loading modal
        function openLoadingModal()
        {
            var timeout;

            $.modal({
                contentAlign: 'center',
                width: 240,
                title: 'Loading',
                content: '<div style="line-height: 25px; padding: 0 0 10px"><span id="modal-status">Contacting server...</span><br><span id="modal-progress">0%</span></div>',
                buttons: {},
                scrolling: false,
                actions: {
                    'Cancel': {
                        color:    'red',
                        click:    function(win) { win.closeModal(); }
                    }
                },
                onOpen: function()
                {
                        // Progress bar
                    var progress = $('#modal-progress').progress(100, {
                            size: 200,
                            style: 'large',
                            barClasses: ['anthracite-gradient', 'glossy'],
                            stripes: true,
                            darkStripes: false,
                            showValue: false
                        }),

                        // Loading state
                        loaded = 0,

                        // Window
                        win = $(this),

                        // Status text
                        status = $('#modal-status'),

                        // Function to simulate loading
                        simulateLoading = function()
                        {
                            ++loaded;
                            progress.setProgressValue(loaded+'%', true);
                            if (loaded === 100)
                            {
                                progress.hideProgressStripes().changeProgressBarColor('green-gradient');
                                status.text('Done!');
                                win.getModalContentBlock().message('Content loaded!', {
                                    classes: ['green-gradient', 'align-center'],
                                    arrow: 'bottom'
                                });
                                setTimeout(function() { win.closeModal(); }, 1500);
                            }
                            else
                            {
                                if (loaded === 1)
                                {
                                    status.text('Loading data...');
                                    progress.changeProgressBarColor('blue-gradient');
                                }
                                else if (loaded === 25)
                                {
                                    status.text('Loading assets (1/3)...');
                                }
                                else if (loaded === 45)
                                {
                                    status.text('Loading assets (2/3)...');
                                }
                                else if (loaded === 85)
                                {
                                    status.text('Loading assets (3/3)...');
                                }
                                else if (loaded === 92)
                                {
                                    status.text('Initializing...');
                                }
                                timeout = setTimeout(simulateLoading, 50);
                            }
                        };

                    // Start
                    timeout = setTimeout(simulateLoading, 2000);
                },
                onClose: function()
                {
                    // Stop simulated loading if needed
                    clearTimeout(timeout);
                }
            });
        };
                  
                  
/*
 * Agenda scrolling
 * This example shows how to remotely control an agenda. most of the time, the built-in controls
 * using headers work just fine
 */

    // Days      
var daysName = ['{lang line="dashboard_agenda_sunday"}', '{lang line="dashboard_agenda_monday"}', '{lang line="dashboard_agenda_tuesday"}', '{lang line="dashboard_agenda_wednesday"}', '{lang line="dashboard_agenda_thursday"}', '{lang line="dashboard_agenda_friday"}', '{lang line="dashboard_agenda_saturday"}'],

    // Name display
    agendaDay = $('#agenda-day'),

    // Agenda scrolling
    agenda = $('#agenda').scrollAgenda({
        first: '{$agendaToday}',
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
$('#agenda-previous').click(function(event){
    event.preventDefault();
    agenda.scrollAgendaToPrevious();
});
$('#agenda-today').click(function(event){
    event.preventDefault();
    agenda.scrollAgendaFirstColumn('{$agendaToday}');
});
$('#agenda-next').click(function(event){
    event.preventDefault();
    agenda.scrollAgendaToNext();
});