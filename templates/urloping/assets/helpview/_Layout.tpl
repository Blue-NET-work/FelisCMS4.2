<!DOCTYPE HTML>
<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>
    <!-- mete dane -->
    <meta charset="utf-8">
    {*
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="user-scalable=0, initial-scale=1.0, target-densitydpi=115">
    *}
    <meta name="author" content="Mateusz Serwinowski (serwin) - Blue-NET.pl">
    <!-- styles -->
	<link href="{$TEMPLATES}assets/css/style.css" rel="stylesheet" type="text/css">
	<link href="{$TEMPLATES}assets/cookie/main.css" rel="stylesheet" type="text/css">

{block name="head"}{/block}

</head>
<body>

    <!-- header
    ================================================= -->
{include file="assets/helpview/header.tpl"}


    <!-- content
    ================================================= -->
    <section id="content">
    	<div class="container">
{block name="content"}{/block}
		</div>
	</section>


    <!-- footer
    ================================================= -->
{include file="assets/helpview/footer.tpl"}

    <!-- jQuery
    ================================================= -->
    <script src="{$TEMPLATES}assets/js/jquery-1.11.0.js"></script>
    <script src="{$TEMPLATES}assets/js/bootstrap.js"></script>
    <script src="{$TEMPLATES}assets/cookie/support-opt-in.js"></script>
    <script src="{$TEMPLATES}assets/cookie/require-opt-in.js"></script>
{block name="jQuery"}{/block}

	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/pl_PL/all.js#xfbml=1&appId=218952124931180";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
</body>
</html>