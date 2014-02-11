// JavaScript Document
                                                    
$.template.init(); 
Tinycon.setBubble(2);
                                                                                              
if (notify.hasNotificationAPI() && !notify.isNotificationPermissionSet())
{
    setTimeout(function()
    {
        notify.showNotificationPermission('{lang line="felis_info_api_chrome"}', function()
        {
            // Confirmation message
            if (notify.hasNotificationPermission())
            {
                notify('{lang line="felis_info_api_chrome_enable"}', '{lang line="felis_info_api_chrome_enable_info"}', {
                    icon: '{$base_url}public/img/demo/icon.png',
                    system: true
                });
            }
            else
            {
                notify('{lang line="felis_info_api_chrome_disabled"}', '{lang line="felis_info_api_chrome_disabled_info"}', {
                    icon: '{$base_url}public/img/demo/icon.png'   
                });
            }
        });

    }, 2000);
}
   
// Generowanie podglądu strony
$(".preview").on("click", function(){
    var url = $(this).attr('data-href'),
        urlTitle = $(this).attr('data-title'),
        titleSite = "";
        if(urlTitle) {
            titleSite = " - "+ urlTitle
        }
    $.modal({
        title: 'FelisCMS 4 - {lang line="default_sidebar_access_preview"}'+ titleSite,    
        url: url,           
        maxWidth: $(window).width()-150,
        height: $(window).height()-100, 
        useIframe: true     
    });
});     

{literal}
var lastTab = $.cookie('lastTab'),
    firstTab = $('#panel #navTabs a:first').tab('show');
  if (lastTab){
      if($('#panel #navTabs a[href='+lastTab+']')){
        $('#panel #navTabs a[href='+lastTab+']').tab('show'); 
      }else{firstTab}  
  }else{firstTab}
{/literal}     
         
// Zmiana wielkości okna mainContent
/*
$(document).ready(felisResize);
$(window).resize(felisResize);

function felisResize(){
	var siteWidth = $(window).width(),
		siteHeight = $(window).height();
	$("#main").height(siteHeight);	
	
	notify('{lang line="felis_info_site_resize"}', '{lang line="felis_info_site_resize_info"}', {
		icon: '{$base_url}public/img/favicon.png'
	});
}
*/