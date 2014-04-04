{include file="assets/helpview/head.tpl" titleTag="{lang line='pages_titleTag'}"}
</head>
<body class="clearfix with-menu">

    <!-- Main content
    ================================================== -->
    <section role="main" id="main">
        <section id="mainContent">

           <!-- TOP
            ================================================== -->
            {include file="assets/helpview/header.tpl"}

            <!-- Body Header
            ================================================== -->

            <!-- Body Header
            ================================================== -->
            <header>
                <h1 class="title"><i class="fa fa-2x fa-list"></i>  {lang line="pages_titleTag"}</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>
                  <li class="active">{lang line="pages_titleTag"}</li>
                </ul>
            </header>

            <div class="panel panel-default panel-black" id="panel">
                <div class="panel-heading"> {lang line="pages_titleTag"}
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
                        <th>{lang line="users_username"}</th>
                        <th>{lang line="users_company"}</th>
                        <th>{lang line="users_first_name"} {lang line="users_last_name"}</th>
                        <th>{lang line="users_email"}</th>
                        <th>{lang line="users_created_on"}</th>
                        <th>{lang line="users_last_login"}</th>
                        <th style="width: 90px; text-align: center;">{lang line="default_action"}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$users item=item name=users}
                        <!-- wpis -->
                            <tr>
                                <td>{$item->id}</td>
                                <td>
                                {foreach item=group from=$item->groups}
                                    <span class="meter {$group->ug_color}" title="{$group->ug_name}"></span>
                                {/foreach}
                                {$item->username}
                                </td>
                                <td>{$item->company}</td>
                                <td>{$item->first_name} {$item->last_name}</td>
                                <td>{$item->email}</td>
                                <td>{$item->created_on|date_format:"%Y-%m-%d  %H:%S:%I"}</td>
                                <td>{$item->last_login|date_format:"%Y-%m-%d %H:%S:%I"}</td>
                                <td class="actions">
                                    <a href="{$base_url}users/edit/{$item->id}.html" title="{lang line="default_edit"}" class="felisEdit with-tooltip glyphicon glyphicon-pencil"></a>
                                {if $item->active == 0}
                                    <a  id="status_{$item->id}" title="{lang line="default_active"}" data-item="{$item->id}" href="#" class="felisAccept glyphicon glyphicon-ok-circle with-tooltip"></a>
                                {else}
                                    <a id="status_{$item->id}" title="{lang line="default_block"}" data-item="{$item->id}" href="#" class="felis glyphicon glyphicon-remove-circle with-tooltip"></a>
                                {/if}
                                    <a href="#" data-item="{$item->id}" title="{lang line="default_delete"}" class="felisDel glyphicon glyphicon-trash with-tooltip confirm"></a>
                                </td>
                            </tr>
                        <!-- koniec wpisu -->
                    {/foreach}
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
    {include file="assets/js/scripts/felis.function.users.js"}
    </script>

</body>
</html>