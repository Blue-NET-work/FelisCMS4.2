    <li class="with-right-arrow">
        <span {if $uri[1]=="nagrody"}class="current"{/if}><i class="fa fa-gift"></i>Nagrody</span>
        <ul class="big-menu">
            <li><a href="{$base_url}nagrody.html" {if $uri[1]=="nagrody" AND $uri[2]==""}class="current navigable-current"{/if}><i class="fa fa-list"></i>Lista nagród</a></li>
            <li><a href="{$base_url}nagrody/add.html" {if $uri[1]=="nagrody" AND $uri[2]=="add"}class="current navigable-current"{/if}><i class="fa fa-plus"></i>Dodaj nagrodę</a></li>
        </ul>
    </li>