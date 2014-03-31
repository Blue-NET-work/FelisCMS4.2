

{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-mail"></i> Newsletter</div>
          <div class="panel-body padding-10">

            <p>Newsletter to darmowa usługa, dzięki której możesz otrzymywać darmowe powiadomienia o aktualnościach, wprost do swojej skrzynki poczty elektronicznej. Zapisanie się? jest nieobowiązkowe, w każdej chwili możesz się? także wypisać.</p>

			<form role="form" action="" method="POST">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Adres e-mail</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Podaj email">
			  </div>
			  <button type="submit" class="btn btn-default">zapisz</button>
			</form>

			<p>Jeśli chcesz się? wypisać, <a href="#">przejdź do strony wypisania</a></p>

          </div>
        </div>

{/block}