{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$a_name}</title>
{/block}

{block name="content"}


<!-- BEGIN ARTICLES -->
<section id="articles">
	<div class="container">
		<h4>{$a_name}</h4>

        <div class="panel panel-default">
          <div class="panel-body article">

            {$a_description}

          </div>
        </div>
    </div>
</section>
<!-- END ARTICLES -->

{/block}

{block name="jQuery"}
{/block}