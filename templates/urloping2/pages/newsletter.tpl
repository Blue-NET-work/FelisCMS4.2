{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Newsletter</title>
{/block}

{block name="content"}


<!-- BEGIN ARTICLES -->
<section id="articles">
	<div class="articlesIcon"></div>
	<div class="container">
		<h4><i class="fa fa-mail"></i> Newsletter</h4>

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-body padding-10">

            <p>Newsletter to darmowa usługa, dzięki której możesz otrzymywać darmowe powiadomienia o aktualnościach, wprost do swojej skrzynki poczty elektronicznej. Zapisanie się? jest nieobowiązkowe, w każdej chwili możesz się? także wypisać.</p>

			<form role="form" action="" method="POST">
			  <div class="form-group">
			    <label for="exampleInputEmail1">Adres e-mail</label>
			    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Podaj email">
			  </div>
			  <button type="submit" class="btn btn-default">zapisz</button>
			</form>

			<p class="m-t-10">Jeśli chcesz się? wypisać, <a href="#">przejdź do strony wypisania</a></p>

          </div>
        </div>
    </div>
</section>
<!-- END ARTICLES -->

{/block}

{block name="jQuery"}
{/block}