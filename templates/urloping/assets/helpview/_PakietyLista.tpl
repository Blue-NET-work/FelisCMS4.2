
  <div class="panel boxShadow">
    <div class="panel-heading">
	    <div class="row" data-toggle="collapse" data-parent="#accordion" href="#pakiet{$item.p_id}">
        	<div class="col-md-10">
			  <h4 class="panel-title">
      			{html_image file="{$uploads}images/pakiety/thumb_70/{$item.pp_photo}.{$item.pp_ext}" class="img-thumbnail margin-top-10 margin-right-20" alt="{$item.pp_alt}" title="{$item.pp_title}"}
      			<a href="{$base_url}pakiet/{$item.p_id}.html">{$item.p_name}</a>
			  </h4>
        	</div>
        	<div class="col-md-2 text-center"><div class="margin-top-20"><strong>{$item.p_price} zł</strong></div>+ {$item.p_points} pkt</div>
	    </div>
    </div>
    <div id="pakiet{$item.p_id}" class="panel-collapse collapse">
      <div class="panel-body">
		<table class="table">
        	<tr>
        		<td class="col-md-2 text-center">{html_image file="{$uploads}images/pakiety/thumb_120/{$item.pp_photo}.{$item.pp_ext}" class="img-thumbnail margin-top-10" alt="{$item.pp_alt}" title="{$item.pp_title}"}</td>
                <td>{$item.p_description|truncate:220:"...":true}</td>
                <td class="col-md-1 text-center"><div class="margin-top-30">{$item.p_term} dni</div></td>
                <td class="col-md-1 text-center"><div class="margin-top-20"><p><strong>{$item.p_price} zł</strong></p>+ {$item.p_points} pkt</div></td>
                <td class="col-md-1 text-right"><div class="margin-top-30"><a href="{$base_url}pakiet/{$item.p_id}.html" class="btn btn-default btn-sm">Rezerwuj</a></div></td>
        	</tr>
		</table>
      </div>
    </div>
  </div>