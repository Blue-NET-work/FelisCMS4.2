{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - {$name}</title>
{/block}

{block name="content"}

        <div class="panel panel-default panel-green margin-top-20">
          <div class="panel-heading"><i class="fa fa-ticket"></i> {$pakiet.p_name}</div>
          <div class="panel-body padding-10">

		        <!-- items -->
		        <div class="row">
                    <div class="col-md-6">
	                {if $id == 1}
				        {html_image file="{$uploads}/obiekty/1b176080874c992ae783432ba494002f2b8b6e1cs.jpg" class="img-thumbnail" width="100%" height="100%" alt=""}
			        {else}
				        {html_image file="{$uploads}/obiekty/6449fed60f8e0818e7aa6da1716f31699220768bs.jpg" class="img-thumbnail" width="100%" height="100%" alt=""}
				    {/if}
                    </div>
                    <div class="col-md-6">
                    	<div class="row margin-top-10 margin-bottom-20">
                            <div class="col-md-6">Pobyt {$pakiet.p_term} dni</div>
                            <div class="col-md-6 text-center"><strong>{$pakiet.p_price} zł</strong><br>+ {$pakiet.p_points} pkt</div>
                    	</div>

                    	{$pakiet.p_description}

                        <div class="margin-top-20 text-center">
                    		<a href="{$base_url}panel/rezerwuj/{$pakiet.p_id}" class="btn btn-success">zamów</a>
                        </div>
                    </div>
		        </div>
		        <!-- items -->

          </div>
        </div>

{/block}