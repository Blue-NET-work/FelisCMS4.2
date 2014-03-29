    <li class="with-right-arrow">
        <span {if $uri[1]=="hotels"}class="current"{/if}><i class="fa fa-building-o"></i> Hotele</span>
        <ul class="big-menu">
            <li><a href="{$base_url}hotels.html" {if $uri[1]=="hotels" AND $uri[2]==""}class="current navigable-current"{/if}><i class="fa fa-list"></i>Lista hoteli</a></li>
            <li><a href="{$base_url}hotels/add.html" {if $uri[1]=="hotels" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="fa fa-plus"></i>Dodaj hoteli</a></li>
        </ul>
    </li>