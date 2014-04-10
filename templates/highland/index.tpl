{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>HIGHLAND SUDETY</title>
{/block}

{block name="content"}

{/block}
{block name="jQuery"}
    <script src="{$TEMPLATES}assets/js/plugins.js"></script>
    <!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/tinycarousel/lib/jquery.tinycarousel.js"></script>

	<!-- Add fancyBox -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

	<!-- Optionally add helpers - button, thumbnail and/or media -->
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<script type="text/javascript" src="{$TEMPLATES}assets/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

    <script type="text/javascript">
	$(document).ready(function(){
		if($('.pakwypmap-map')) {
		// Loop through each AREA in the imagemap
			$('.pakwypmap-map area').each(function() {
				$( this ).hoverIntent( function() {
				  var country_id = $(this).attr('id').replace('area_', '');
								$('#'+country_id).fadeIn('medium');
				}, function() {
				  var country_id = $(this).attr('id').replace('area_', '');
								$('#'+country_id).fadeOut('fast');
				});
				// Assigning an action to the click event
			});
			$('.pakwypmap-map area').fancybox({ 'autoDimensions' : true });
			$('.pakwypmap-map ul.regionslist>li>a').fancybox({ 'autoDimensions' : true });
		};

			$('#slider1').tinycarousel();
	});
	</script>
{/block}