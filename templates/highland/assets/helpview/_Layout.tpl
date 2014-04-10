<!DOCTYPE HTML>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>
    <!-- mete dane -->
    <meta charset="utf-8">
    {*<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">*}
    <meta name="author" content="Mateusz Serwinowski (serwin) - Blue-NET.pl">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="user-scalable=0, initial-scale=1.0, target-densitydpi=115">

    <!-- styles -->
	<link href="{$TEMPLATES}assets/css/style.css" rel="stylesheet" type="text/css">
	<link href="{$TEMPLATES}assets/cookie/main.css" rel="stylesheet" type="text/css">

<<<<<<< HEAD
	<!-- Add fancyBox -->
	<link rel="stylesheet" href="{$TEMPLATES}assets/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
	<link rel="stylesheet" href="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />

{block name="head"}{/block}


=======
{block name="head"}{/block}

>>>>>>> 7a1246b4feeaee0749ede34089314f36eca92c3a
</head>
<body>

    <!-- header
    ================================================= -->
{include file="assets/helpview/header.tpl"}


    <!-- content
    ================================================= -->
	<div class="content">
		<div class="watermark"></div>
{block name="content"}{/block}

	</div>


    <!-- jQuery
    ================================================= -->
    <script src="{$TEMPLATES}assets/js/jquery-1.11.0.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap.js"></script>
    <script src="{$TEMPLATES}assets/cookie/support-opt-in.js"></script>
    <script src="{$TEMPLATES}assets/cookie/require-opt-in.js"></script>
<<<<<<< HEAD

	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".fancybox").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none' ,
			helpers : {
				media : {},
				thumbs	: {}
			}
		});
	});
	</script>

{block name="jQuery"}{/block}

=======
{block name="jQuery"}{/block}

	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/pl_PL/all.js#xfbml=1&appId=218952124931180";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
>>>>>>> 7a1246b4feeaee0749ede34089314f36eca92c3a
</body>
</html>