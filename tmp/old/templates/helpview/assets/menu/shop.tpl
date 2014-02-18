
<li class="with-right-arrow">
    <span {if $uri[1]=="shop"}class="current"{/if}><i class="menu1-basket"></i> Sklep</span>
    <ul class="big-menu {if $uri[1]=="shop" AND $uri[2]!=""}navigable-current{/if}">
        <li class="with-right-arrow">
            <a href="{$base_url}shop/category.html" {if $uri[1]=="shop" AND $uri[2]=="category"}class="current"{/if}><i class="menu1-books"></i> Kategorie</a>
        </li>
        <li class="with-right-arrow">
            <span {if $uri[1]=="shop" AND $uri[2]=="products"}class="current"{/if}><i class="menu1-shirt"></i> Produkty</span>
            <ul class="big-menu">
                <li><a href="#"><i class="menu1-list"></i> Lista produktów</a></li>
                <li><a href="#"><i class="menu1-pen"></i> Dodaj produkt</a></li>
            </ul>
        </li>
        <li class="with-right-arrow">
            <a href="{$base_url}shop/producers.html" {if $uri[1]=="shop" AND $uri[2]=="producers"}class="current navigable-current"{/if}><i class="menu1-factory"></i> Producenci</a>
        </li>
        <li class="with-right-arrow">
            <span {if $uri[1]=="shop" AND $uri[2]=="invoice"}class="current"{/if}><i class="menu1-money"></i> Faktury</span>
            <ul class="big-menu">
                <li><a href="#">Faktury Proforma</a></li>
                <li><a href="#">Faktury VAT</a></li>
                <li><a href="#">Zestawienia</a></li>
            </ul>
        </li>
        <li class="with-right-arrow">
            <span {if $uri[1]=="shop" AND $uri[2]=="order"}class="current"{/if}><i class="menu1-dollar"></i> Zamówienia</span>
            <ul class="big-menu">
                <li><a href="#">Do realizacji</a></li>
                <li><a href="#">Wysłane</a></li>
                <li><a href="#">Opłacone</a></li>
                <li><a href="#">Pobraniowe</a></li>
            </ul>
        </li>
        <li class="with-right-arrow">
            <span {if $uri[1]=="shop" AND $uri[2]=="settings"}class="current"{/if}><i class="menu1-settings"></i> Ustawienia</span>
            <ul class="big-menu">
                <li><a href="#">Integracje</a></li>
                <li><a href="#">Dane sklepu</a></li>
                <li><a href="#">Metody płatności</a></li>
            </ul>
        </li>
    </ul>
</li>