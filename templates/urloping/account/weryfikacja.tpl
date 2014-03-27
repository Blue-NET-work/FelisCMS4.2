{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-ticket"></i> Weryfikacja płatności</div>
          <div class="panel-body padding-10">
          {if $payments}
          	<div class="alert alert-success">Płatność zweryfikowana poprawnie!</div>
          {else}
          	<div class="alert alert-danger">Wystąpił problem z płatnością! </div>
          {/if}
          </div>
        </div>

{/block}