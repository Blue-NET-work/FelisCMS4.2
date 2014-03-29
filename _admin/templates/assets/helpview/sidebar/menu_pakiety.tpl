    <li class="with-right-arrow">
        <span {if $uri[1]=="pakiety"}class="current"{/if}><i class="fa fa-tags"></i> Pakiety</span>
        <ul class="big-menu">
            <li><a href="{$base_url}pakiety.html" {if $uri[1]=="pakiety" AND $uri[2]==""}class="current navigable-current"{/if}><i class="fa fa-list"></i> Lista pakietów</a></li>
            <li><a href="{$base_url}pakiety/add.html" {if $uri[1]=="pakiety" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="fa fa-plus"></i> Dodaj pakiet</a></li>
        </ul>
    </li>