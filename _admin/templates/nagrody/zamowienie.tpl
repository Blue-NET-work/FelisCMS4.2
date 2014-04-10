{include file="assets/helpview/head.tpl" titleTag="{lang line='pages_titleTag'}"}

    <link rel="stylesheet" href="{$TEMPLATES}assets/js/libs/DataTables/jquery.dataTables-simple.css">
</head>
<body class="clearfix with-menu">

    <!-- Main content
    ================================================== -->
    <section role="main" id="main">
        <section id="mainContent">
            {include file="assets/helpview/header.tpl"}

            <!-- Body Header
            ================================================== -->
            <header>
                <h1 class="title"><i class="fa fa-2x fa-list"></i>  Zamówienie</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>
                  <li class="active">Zamówienie</li>
                </ul>
            </header>

            <div class="panel panel-default panel-black" id="panel">
                <div class="panel-heading">  Zamówienie
                    <div class="absolute-right">
                        <!-- toggle (show hide) -->
                        <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>
                    </div>
                </div>
                <!-- ./end panel-heading -->
                <div id="panel-body" class="panel-body in">

                	<div class="row large-margin-bottom">
                    	<div class="col-md-4">
                        	<p><strong>Zamówienie:</strong> {$payment.p_sygnatura}</p>
                        	<p><strong>Zamawiający:</strong> {$payment.first_name} {$payment.last_name}</p>
                    	</div>
                    	<div class="col-md-4">
                        	<p><strong>Zamówionych nagród:</strong> {$payment.p_qty} szt</p>
                        	<p><strong>Kwota dopłaty:</strong> {$payment.p_brutto} zł</p>
                    	</div>
                    	<div class="col-md-4">
                        	<p><strong>Data zamówienia:</strong> {$payment.p_date}</p>
                    	</div>
                	</div>

                    <table class="datatable table table-striped table-hover large-margin-top" id="table">
                      <thead>
                        <tr>
                            <th style="min-width:30px;">ID</th>
                            <th>Nagroda</th>
                            <th>Sztuk</th>
                            <th>Dopłata</th>
                            <th>Obciązenie punktów</th>
                            <th style="width: 90px; text-align: center;">{lang line="default_action"}</th>
                        </tr>
                      </thead>
                      <tbody>
                        {foreach from=$payment_position item=item name=payment_position}
                            <!-- wpis -->
                                <tr>
                                    <td>{$item.pp_id}</td>
                                    <td>{$item.pp_name}</td>
                                    <td>{$item.pp_qty}</td>
                                    <td>{$item.pp_value_brutto}</td>
                                    <td>{$item.pp_nagroda_point_total}</td>
                                    <td class="actions">
                                        {*<a href="{$base_url}nagrody/zamowienie/{$item.p_id}.html" title="Podgląd zamówienia" class="felisEdit with-tooltip fa fa-search"></a>*}
                                    </td>
                                </tr>
                            <!-- koniec wpisu -->
                        {/foreach}
                      </tbody>
                    </table>

                    <div class="large-margin-top text-right">
                    	<a href="{$base_url}nagrody/realizacja/{$payment.p_id}" class="btn btn-success"><i class="fa fa-check"></i> Realizuj</a>
                    </div>

                </div>
            </div>


          </section>
    </section>

   <!-- Sidebar
    ================================================== -->
    {include file="assets/helpview/sidebar.tpl"}

{include file="assets/helpview/footer.tpl"}


    <script>
    {include file="assets/js/scripts/felis.function.nagrody.js"}
    </script>

</body>
</html>