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
                <h1 class="title"><i class="fa fa-2x fa-pencil"></i>  Edycja artykułów</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>
                  <li class="active">Edycja artykułów</li>
                </ul>
            </header>

            <!-- panel -->
            <div class="panel panel-black" id="panel">
              <div class="panel-heading">
                Edycja artykułów
                <div class="absolute-right">
                    <ul class="nav nav-tabs" id="navTabs">
                        <li class="active"><a href="#data" data-toggle="tab" class="panel-link">{lang line="default_data"}</a></li>
                        <li><a href="#desc" data-toggle="tab" class="panel-link">{lang line="default_description"}</a></li>
                    </ul>
                    <!-- toggle (show hide) -->
                    <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>
                </div>
              </div>
              <!-- ./end panel-heading -->
              <div id="panel-body" class="panel-body in">
                    {include file="articles/_ArticlesForm.tpl"}
              </div>
            </div>
            <!-- panel -->

        </section>
    </section>
    <!-- End main content -->

   <!-- Sidebar
    ================================================== -->
    {include file="assets/helpview/sidebar.tpl"}

{include file="assets/helpview/footer.tpl"}
<script src="{$base_url}../felis/modules/ckfinder/ckfinder.js"></script>
<script src="{$base_url}../felis/modules/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	var editor = CKEDITOR.replace( 'item[a_description]' );
	CKFinder.setupCKEditor( editor, "{$base_url}../felis/modules/ckfinder/" );
</script>
</body>
</html>