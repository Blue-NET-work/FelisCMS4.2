        {*extends file='./events_messages.tpl'*}
        {if $newMessages || $eventsToday}
        <!-- Wiadomości i dzisiejsze wydażenia
        ================================================== -->
        <ul class="unstyled-list">
        {if $eventsToday}
            <li class="title-menu">{lang line="default_sidebar_today_event"}</li>
            <li>
                <ul class="calendar-menu">
                    <li>
                        <a href="#" title="See event">
                            <time datetime="2011-02-24"><b>24</b> Feb</time>
                            <small class="green">10:30</small>
                            Event's description
                        </a>
                    </li>     
                </ul>
            </li>
        {/if}
        {if $newMessages}
            <li class="title-menu">{lang line="default_sidebar_new_messages"}</li>
            <li>
                <ul class="message-menu">  
                    <li>
                        <a href="#" title="Read message">
                            <span class="message-status">
                                <span class="unstarred">Not starred</span>
                                <span class="new-message">New</span>
                            </span>
                            <span class="message-info">
                                <span class="blue">15:47</span>
                            </span>
                            <strong class="blue">May Starck</strong><br>
                            <strong>Mail subject a bit longer</strong>
                        </a>
                    </li>    
                </ul>
            </li>
        {/if}
        </ul><!-- ./end Wiadomości i dzisiejsze wydażenia -->
        {/if}