{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$meta_title}</title>
{/block}

{block name="content"}

<!-- BEGIN CONTACT -->
<section id="contact">
	<div class="container m-t-50 m-b-40">
		<div class="row">
        	<div class="col-md-6">{$description}</div>
        	<div class="col-md-6">
				<form id="contact_form" class="Kontakt" method="post" action="?s=Kontakt">

					<div class="form-group">
						<label for="name">Imię i nazwisko:</label>
						<input type="text" name="name" class="form-control input-sm">
					</div>
					<div class="form-group">
						<label for="company">Nazwa firmy:</label>
						<input type="text" name="company" class="form-control input-sm">
					</div>
					<div class="form-group">
						<label for="from">Adres e-mail:</label>
						<input type="text" name="from" class="form-control input-sm">
					</div>
					<div class="form-group">
						<label for="tel">Telefon:</label>
						<input type="text" name="tel" class="form-control input-sm">
					</div>
					<div class="form-group">
						<label for="subject">Temat wiadomości:</label>
						<input type="text" name="subject" class="form-control input-sm">
					</div>
					<div class="form-group">
						<label for="text">Treśc wiadomości:</label>
						<textarea name="text" class="form-control input-sm"></textarea>
					</div>
					<div class="form-group">
						<label for="contact">Preferowana forma kontaktu:</label>
						<select name="contact" class="form-control input-sm">
							<option value="0" selected="selected">wybierz</option>
							<option value="1">kontakt przez e-mail</option>
							<option value="2">kontakt telefoniczny</option>
						</select>
					</div>
					<input type="submit" name="contact_send" class="btn btn-default btn-sm" value="wyślij...">

				</form>
        	</div>
		</div>
	</div>
</section>
<!-- END CONTACT -->

{/block}

{block name="jQuery"}
{/block}
