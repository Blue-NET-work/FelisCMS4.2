{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-ticket"></i> Weryfikacja płatności</div>
          <div class="panel-body padding-10">
          {if $payments}
          	Płatność zweryfikowana poprawnie!
          {else}
          	Wystąpił problem z płatnością!
          {/if}
          </div>
        </div>

{/block}