{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}

        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-bell-o"></i> Oferta tygodnia</div>
          <div class="panel-body padding-10">
            <h3 class="margin-top-10 margin-bottom-25">{$pakiet.p_name}</h3>
          	<div class="row">
            	<div class="col-md-8">
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

                    		<button class="btn btn-success">zamów</button>
                    	</div>
		            </div>
		            <!-- items -->
            	</div>
            	<div class="col-md-4">
            		<h4>O hotelu: {$hotel.name}</h4>
            	<p>
                    {if $hotel.stars == 5}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {elseif $hotel.stars == 4}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {elseif $hotel.stars == 3}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {elseif $hotel.stars == 2}
                        <i class="fa fa-star"></i><i class="fa fa-star"></i>
                    {else}
                        <i class="fa fa-star"></i>
                    {/if}
            	</p>
            		{$hotel.description}
                    <h4>Na terenie obiektu znajduje się:</h4>
                    <ul class="fa-ul">
					  <li><i class="fa-li fa fa-check-square"></i>List icons (like these)</li>
					  <li><i class="fa-li fa fa-check-square"></i>can be used</li>
					  <li><i class="fa-li fa fa-check-square"></i>can be used</li>
					  <li><i class="fa-li fa fa-square"></i>default bullets in lists</li>
					</ul>
            	</div>
          	</div>

          </div>
            </div>

{/block}