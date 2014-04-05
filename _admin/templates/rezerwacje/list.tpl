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
                <h1 class="title"><i class="fa fa-2x fa-list"></i>  Lista rezerwacji</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>
                  <li class="active">  Lista rezerwacji</li>
                </ul>
            </header>

            <div class="panel panel-default panel-black" id="panel">
                <div class="panel-heading"> Lista rezerwacji
                    <div class="absolute-right">
                        <!-- toggle (show hide) -->
                        <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>
                    </div>
                </div>
                <!-- ./end panel-heading -->
                <div id="panel-body" class="panel-body in">
                    <table class="datatable table table-striped table-hover" id="table">
                      <thead>
                        <tr>
                            <th style="min-width:30px;">ID</th>
                            <th>Użytkownik</th>
                            <th>Nazwa pakietu</th>
                            <th>PayU ID</th>
                            <th>{lang line="default_adres"}</th>
                            <th>Status realizacji</th>
                            {if $service_multilang == 'TRUE'}<th>{lang line="default_sidebar_access_lang"}</th>{/if}
                            <th style="width: 90px; text-align: center;">{lang line="default_action"}</th>
                        </tr>
                      </thead>
                      <tbody>
                      {if $pages}
                        {foreach from=$pages item=item name=pages}
                            <!-- wpis -->
                                <tr>
                                    <td>{$item.r_id}</td>
                                    <td>{$item.u_name}</td>
                                    <td>{$item.p_name}</td>
                                    <td>{$item.p_payu}</td>
                                    <td nowrap="nowrap"><a href="#" data-href="{$base_url}../pakiet/{$item.r_pid}.html" class="preview with-tooltip" title="{lang line="default_sidebar_access_preview"}" data-title="{$item.p_name}">pakiet/{$item.r_pid}.html</a></td>
                                    <td id="r_status{$item.r_id}">
		                            {if $item.r_status == 2}
		                                <span class="label label-success">Zatwierdzona</span>
		                            {elseif $item.r_status == 3}
		                                <span class="label label-danger">Odrzucona</span>
		                            {elseif $item.r_status == 1}
                            			<span class="label label-info">Oczekuje na akceptacje hotelu.</span>
		                            {else}
                            			<span class="label label-default">Oczekuje na wpłacenie zaliczki.</span>
		                            {/if}
                                    </td>
                                    <td class="actions">
                                        <a  id="status_{$item.r_id}" title="Akceptacja" data-item="{$item.r_id}" href="#" class="felisAccept glyphicon glyphicon-ok-circle with-tooltip"></a>
                                        <a  id="status_{$item.r_id}" title="Odrzucenie" data-item="{$item.r_id}" href="#" class="felis glyphicon glyphicon-remove-circle with-tooltip"></a>
                                    </td>
                                </tr>
                            <!-- koniec wpisu -->
                        {/foreach}
                      {/if}
                      </tbody>
                    </table>
                </div>
            </div>


          </section>
    </section>

   <!-- Sidebar
    ================================================== -->
    {include file="assets/helpview/sidebar.tpl"}

{include file="assets/helpview/footer.tpl"}


    <script>
    {include file="assets/js/scripts/felis.function.reservation.js"}
    </script>

</body>
</html>