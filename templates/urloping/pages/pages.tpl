{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading">{$name}</div>
              <div class="panel-body">
	              {$description}
	              {if $alias == "kontakt"}
  </div><div id="contact_data">
<h2 class="contact_header">Kontakt z Nami</h2><p class="contact info1">Chcesz dowiedzieć się więcej ?</p>
<p class="contact info2">Masz wątpliwości, która oferta będzie najlepsza ?</p>
<p class="contact info3">A może chcesz dokonać rezerwacji telefonicznie ?</p>
<p class="contact info4 separated">Zadzwoń lub napisz:</p>
<p class="contact tel separated">+48 883 255 442</p>
<p class="contact email">E-mail: info@urloping.com</p>
<p class="contact telinfo">( 7 dni w tygodniu od 10:00 do 19:00 )</p>
<p class="contact info5 separated">Możesz także skorzystać z formularza kontaktowego</p>
<p class="contact info6">_____________________________________________</p>
<p class="contact infoadd separated">Dodaj obiekt do bazy urloping.com:</p>
<p class="contact addr separated">ul. Wierzbowa 1A lok. 47</p>
<p class="contact addr2">87-720 Ciechocinek</p>
<p class="contact addr3">+48 793 103 649</p>
<p class="contact addr4email">biuro@urloping.com</p>
<p class="contact addr5">( pn-pt, 9:00-17:00 )</p>
<p class="contact addr6 separated">Możesz także skorzystać z formularza kontaktowego</p>
</div>
<img src="/templates/urloping/files/form.png" class="no_border"><form id="contact_form" class="Kontakt" method="post" action="?s=Kontakt">
<label for="name">Imię i nazwisko:</label><input type="text" name="name">
<label for="company">Nazwa firmy:</label><input type="text" name="company">
<label for="from">Adres e-mail:</label><input type="text" name="from">
<label for="tel">Telefon:</label><input type="text" name="tel">
<label for="subject">Temat wiadomości:</label><input type="text" name="subject">
<label for="text">Treśc wiadomości:</label><textarea name="text"></textarea><label for="contact">Preferowana forma kontaktu:</label><select name="contact">
<option value="0" selected="selected">wybierz</option>
<option value="1">kontakt przez e-mail</option>
<option value="2">kontakt telefoniczny</option>
</select><input type="submit" name="contact_send" class="contact send" value="wyślij...">
</form><div id="contact_txpo" class="Kontakt">
</div>
	              {/if}
              </div>
            </div>

{/block}