<!DOCTYPE html>
<!--
Template Name: urloping2
Version: 2.31.1
Author: Blue-NET Mateusz Serwinowski
Website: http://Blue-NET.pl
Contact: support@blue-net.pl
-->
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html class="no-js" lang="en"><!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8">
    <meta content="Blue-NET Mateusz Serwinowski" name="author">

	<!-- http://davidbcalhoun.com/2010/viewport-metatag -->
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">

	<!-- http://www.kylejlarson.com/blog/2012/iphone-5-web-design/ -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport">

	<!-- BEGIN PACE PLUGIN FILES -->
	<script src="{$TEMPLATES}assets/plugins/pace/pace.min.js" type="text/javascript"></script>
	<link href="{$TEMPLATES}assets/plugins/pace/themes/pace-theme-flash.css" rel="stylesheet" type="text/css">
	<!-- END PACE PLUGIN FILES -->

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300italic,400italic,700,500italic,500,700italic,300|Roboto+Condensed:400italic,700italic,400,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <link href="{$TEMPLATES}assets/css/style.css" rel="stylesheet" type="text/css">

	<link href="{$TEMPLATES}assets/cookie/main.css" rel="stylesheet" type="text/css">

	<!-- JavaScript at bottom except for Modernizr -->
	<script src="{$TEMPLATES}assets/plugins/modernizr.custom.js"></script>

{block name="head"}{/block}

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>

    <!-- header
    ================================================= -->
{include file="assets/helpview/header.tpl"}


    <!-- content
    ================================================= -->
{block name="content"}{/block}

{*
<!-- BEGIN NAGRODA -->
<section id="nagroda">
	<div class="container">

    </div>
</section>
<!-- END NAGRODA -->
*}

<!-- BEGIN NEWSLETTER -->
<section id="newsletter">
	<div class="container">
    	<div class="row">
        	<div class="col-md-2">
            	<div class="newsletterInfo"></div>
            </div>
        	<div class="col-md-7">
            	<p class="m-t-25">Zapisując się do naszego newslettera można zyskać informacje na bierząco o nowych pakietach.</p>
            </div>
        	<div class="col-md-3">
            	<form action="" method="post" class="m-t-15">
                    <div class="input-group">
                      <input type="text" class="form-control" placeholder="Adres e-mail">
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-edit"></i></button>
                      </span>
                    </div><!-- /input-group -->
                </form>
            </div>
        </div>
    </div>
</section>
<!-- END NEWSLETTER -->

    <!-- footer
    ================================================= -->
{include file="assets/helpview/footer.tpl"}


<!-- BEGIN JAVASCRIPTS -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
    <script src="{$TEMPLATES}assets/plugins/respond.min.js"></script>
    <script src="{$TEMPLATES}assets/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="{$TEMPLATES}assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="{$TEMPLATES}assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="{$TEMPLATES}assets/plugins/jquery.scrollTo.js" type="text/javascript"></script>
<script src="{$TEMPLATES}assets/plugins/fancybox/source/jquery.fancybox.js" type="text/javascript"></script>
<script src="{$TEMPLATES}assets/cookie/support-opt-in.js"></script>
<script src="{$TEMPLATES}assets/cookie/require-opt-in.js"></script>
<!-- Optionally add helpers - button, thumbnail and/or media -->


<script src="{$TEMPLATES}assets/plugins/bxslider/jquery.bxslider.js" type="text/javascript"></script>
{literal}
<script>
$('#slider').bxSlider({
  slideWidth: 450,
  mode: 'fade',
  auto: true,
  autoControls: true,
  responsive: true,
  pause: 2000
});
$('.bxslider').bxSlider({
	minSlides: 4,
	maxSlides: 5,
	slideWidth: 350,
	slideMargin: 20,
	moveSlides: 1,
	pager: false,
	responsive: true,
});
</script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pl_PL/all.js#xfbml=1&appId=218952124931180";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
{/literal}

{block name="jQuery"}{/block}

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
