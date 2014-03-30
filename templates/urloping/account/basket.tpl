{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping - Nagrody</title>
{/block}

{block name="content"}

            <!-- pierwszy box -->
            <div class="row">
                <div class="col-md-12 margin-top-20">
                	<!-- miasta -->
                    <div class="panel panel-default panel-green" id="polecaneObiekty">
                      <div class="panel-heading"><i class="fa fa-user"></i> Moje dane</div>
                      <div class="panel-body padding-10">

{include file="assets/helpview/messages.tpl" messages=$messages}

                      	<div class="row margin-top-20">
                        	<div class="col-md-1"></div>
                        	<div class="col-md-10">
					              <table id="basketBN" class="table table-striped">
					              <thead>
					                <tr>
					                  <th style="width:30%">NAZWA</th>
					                  <th class="text-center" style="width:13%;">SZTUK</th>
					                  <th class="text-center" style="width:13%;">CENA J.</th>
					                  <th class="text-center" style="width:11%;">CENA</th>
					                  <th style="width:5%;"></th>
					                </tr>
					              </thead>
					              <tbody>


					              {if $basket_item}
					              {foreach from=$basket_item item=item name=items}
					                <tr>
					                  <td>{$item["name"]}</td>
					                  <td class="text-center">
					                    <a href="{$base_url}panel/qty_add/{$item.rowid}/{$item.qty}.html" class="qtyAdd"><i class="fa fa-plus-circle"></i></a>
					                    {$item.qty}
					                    <a href="{$base_url}panel/qty_remove/{$item.rowid}/{$item.qty}.html" class="qtyRemove"><i class="fa fa-minus-circle"></i></a>
					                  </td>
					                  <td class="text-center">{$item["price"]} zł</td>
					                  <td class="text-right">{$item["subtotal"]} zł</td>
					                  <td class="text-center"><a href="{$base_url}panel/remove/{$item.rowid}.html" class="coquette16-delete"><i class="fa fa-trash-o"></i></a></td>
					                </tr>
					              {/foreach}
					              {else}
					                <tr>
					                  <td colspan="5" style="text-align:center;">Koszyk jest pusty</td>
					                </tr>
					              {/if}
					              </tbody>
					            </table>

					            {if $basket_item}
					            <div class="row">
					                <div class="col-md-12">
					                    <p class="text-right"><span class="label label-info">Razem: {$basket_total} pkt </span></p>
					                    <p class="text-right">Łącznie: {$basket_items} szt.</p>
					                </div>
					            </div>
					            {/if}


					            {if $basket_item}
					            <div class="form-actions">
					                <a href="{$base_url}koszyk/wyczysc.html" class="btn btn-danger pull-left">Wyczyść koszyk</a>
					                <button type="submit" class="btn btn-primary pull-right">Dalej >></button>
					            </div>
					            {/if}

                        	</div>
                        	<div class="col-md-1"></div>
                      	</div>

                      </div>
                    </div>
                    <!-- ./miasta -->
                </div>
            </div>
            <!-- ./pierwszy box-->

{/block}