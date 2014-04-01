{include file="assets/helpview/head.tpl" titleTag="{lang line='pages_titleTag'}"}

    <link rel="stylesheet" href="{$TEMPLATES}assets/js/libs/DataTables/jquery.dataTables-simple.css">
    <link rel="stylesheet" href="{$TEMPLATES}assets/jqueryFileTree/jqueryFileTree.css">
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
                <h1 class="title"><i class="fa fa-2x fa-pencil"></i>  Edycja hotelu</h1>
                <ul class="breadcrumb unstyled-list">
                  <li><a href="#">{lang line="default_control_panel"}</a></li>
                  <li class="active">Edycja hotelu</li>
                </ul>
            </header>

            <!-- panel -->
            <div class="panel panel-black" id="panel">
              <div class="panel-heading">
                Edycja hotelu
                <div class="absolute-right">
                    <ul class="nav nav-tabs" id="navTabs">
                        <li class="active"><a href="#data" data-toggle="tab" class="panel-link">{lang line="default_data"}</a></li>
                        <li><a href="#desc" data-toggle="tab" class="panel-link">{lang line="default_description"}</a></li>
                        <li><a href="#foto" data-toggle="tab" class="panel-link">Zdjęcia</a></li>
                    </ul>
                    <!-- toggle (show hide) -->
                    <a class="panel-toggle" data-toggle="collapse" data-parent="#panel" href="#panel-body"><b class="caret"></b></a>
                </div>
              </div>
              <!-- ./end panel-heading -->
              <div id="panel-body" class="panel-body in">
                    {include file="hotels/_HotelsForm.tpl"}
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
<script src="{$base_url}../felis/modules/ckeditor/ckeditor.js"></script>
<script src="{$TEMPLATES}assets/jqueryFileTree/jqueryFileTree.js"></script>
<script>
$(document).on("click", ".remove", function() {
    $(this).parent().parent().remove();
});

$('#fileTree').fileTree({
    root: '/',
    script: '{$TEMPLATES}assets/jqueryFileTree/jqueryFileTree.php',
    expandSpeed: 800,
    collapseSpeed: 800,
    expandEasing: 'easeOutBounce',
    collapseEasing: 'easeOutBounce',
    loadMessage: 'Ładowanie...',
    multiFolder: false
},  function(file, link) {
    $('#files').append('<div class="row margin-bottom-10"><div class="col-md-5"><img src="'+link+'" class="img-thumbnail" /><input type="hidden" name="files[]" value="'+file+'" size="40"></div><div class="col-md-5"><div class="form-group"><label>Alt:</label><input type="text" class="form-control" name="alt[]" /></div><div class="form-group">Title:<input type="text" class="form-control" name="title[]"/></div></div><div class="col-md-2"><button type="button" class="btn btn-danger remove">usuń</button></div></div>');
});
</script>
</body>
</html>