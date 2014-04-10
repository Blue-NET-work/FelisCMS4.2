{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>HIGHLAND SUDETY - {$meta_title}</title>
{/block}

{block name="content"}
	<div class="container-fluid">
        <div class="panel panel-black">
          <div class="panel-heading">{$name}</div>
          <div class="panel-body">
	          {$description}
          </div>
        </div>
    </div>

{/block}