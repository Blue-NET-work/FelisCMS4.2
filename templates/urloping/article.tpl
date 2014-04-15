{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$a_name}</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-ticket"></i> {$a_name}</div>
          <div class="panel-body padding-10 article">
		  	<div class="margin-top-10 margin-bottom-20 text-info" style="font-size:11px;">Dodano: {$a_date}</div>

            {$a_description}

          </div>
        </div>

{/block}