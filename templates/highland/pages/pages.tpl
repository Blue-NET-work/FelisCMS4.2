{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>HIGHLAND SUDETY - {$name}</title>
{/block}

{block name="content"}
	<div class="container-fluid">
        <div class="panel panel-default panel-green">
          <div class="panel-heading">{$name}</div>
          <div class="panel-body">
	          {$description}
          </div>
        </div>
    </div>

{/block}