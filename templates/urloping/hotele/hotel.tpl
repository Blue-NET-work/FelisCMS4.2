{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-gift"></i> {$name}</div>
          <div class="panel-body padding-10">
          	<div class="row">
            	<div class="col-md-8">

            	</div>
            	<div class="col-md-4">
                    <h5>Na terenie obiektu znajduje się:</h5>
                    <ul class="fa-ul">
					  <li><i class="fa-li fa fa-check-square"></i>List icons (like these)</li>
					  <li><i class="fa-li fa fa-check-square"></i>can be used</li>
					  <li><i class="fa-li fa fa-check-square"></i>can be used</li>
					  <li><i class="fa-li fa fa-square"></i>default bullets in lists</li>
					</ul>
            	</div>
          	</div>
            <!-- items -->
	        {if $id == 1}
	            {html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" class="img-thumbnail" width="40%" height="40%" alt=""}
            {else}
	            {html_image file="{$uploads}/obiekty/6449fed60f8e0818e7aa6da1716f31699220768bs.jpg" class="img-thumbnail" width="40%" height="40%" alt=""}
	        {/if}

	        <h3>{$name}</h3>
	        {$description}

            <!-- items -->
          </div>
        </div>

{/block}