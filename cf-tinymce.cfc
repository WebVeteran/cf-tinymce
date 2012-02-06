<cfcomponent> 

	<cffunction name="tinymce">
		<cfargument name="cssfile" default="/includes/css/base.css,/includes/css/common.css">
		<cfargument name="theme_advanced_styles" default=''> 
		<cfargument name="theme_advanced_blockformats" default="p,h1,h2,h3,blockquote,address,pre,code,h4,h5,h6"> 
		<cfargument name="theme" default="advanced">
		<cfargument name="element" default="content"> 
		<cfargument name="plugins" default="inlinepopups,iespell,style,layer,table,advhr,advimage,imgmap,advlink,insertdatetime,media,searchreplace,print,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras"> 
		<cfargument name="theme_advanced_buttons1" default="default"> 
		<cfargument name="theme_advanced_buttons1_add" default="fontselect,fontsizeselect"> 
		<cfargument name="theme_advanced_buttons2" default="default"> 
		<cfargument name="theme_advanced_buttons2_add_before" default="forecolor,backcolor,separator,iespell,pastetext,pasteword,separator,search,replace,separator">
		<cfargument name="theme_advanced_buttons2_add" default="imgmap">  
		<cfargument name="theme_advanced_buttons3" default="default"> 
		<cfargument name="theme_advanced_buttons3_add_before" default="tablecontrols,separator"> 
		<cfargument name="theme_advanced_buttons3_add" default="media,advhr,fullscreen"> 
		<cfargument name="theme_advanced_statusbar_location" default="bottom"> 
		<cfargument name="theme_advanced_path" default="true"> 
		<cfargument name="extended_valid_elements" default="*[*]"> 
		<cfargument name="content" default=''> 
		<cfargument name="csswidth" default='520px'> 
		<cfargument name="cssheight" default='350px'>
		<cfargument name="resizing" default='true'>
		<cfargument name="compress" default='1'>
		<cfargument name="suffix" default=''>
		<cfargument name="disk_cache" default='true'>
		<cfargument name="path" default='/media/rte/'>
		<cfargument name="skin" default='default'>
		<cfargument name="skin_variant" default=''>
		<cfargument name="external_link_list_url" default='/admin/main/tools/pages.cfm'>
		<cfargument name="body_id" default='wvContent'>
		<cfargument name="gecko_spellcheck" default='true'>
		<cfoutput>
		
		<textarea name='#arguments.element#' id='#arguments.element#' style='width:#csswidth#; height:#cssheight#; visibility:hidden;'>#arguments.content#</textarea>
	
		<cfif not isdefined("Request.cftinymcebaseloaded")>
			<cfsavecontent variable="tinyHead">
			<script type="text/javascript" src="/includes/js/tiny_mce/tiny_mce<cfif arguments.compress eq 1>_gzip</cfif>.js"></script>
			<script language="javascript" type="text/javascript">
			tinyMCE<cfif arguments.compress eq 1>_GZ</cfif>.init({
					plugins : '#arguments.plugins#',
					themes : 'simple,advanced',
					languages : 'en',
					disk_cache : #arguments.disk_cache#,
					debug : false,
					suffix : '#arguments.suffix#',
					dialog_type : 'modal'
			});
			</script>
			</cfsavecontent>
			<cfhtmlhead text="#variables.tinyHead#">
			<cfset Request.cftinymcebaseloaded="1">
		</cfif>	
			
			<script language="javascript" type="text/javascript">
			var configArray#arguments.element# = [{
				mode : 'exact',
				element : "#arguments.element#",
				theme : '#arguments.theme#',
				skin : '#arguments.skin#',
				skin_variant : '#arguments.skin_variant#',
				plugins : '#arguments.plugins#',
				theme_advanced_blockformats: '#arguments.theme_advanced_blockformats#',
				theme_advanced_disable : 'hr',
				
				<cfif arguments.theme_advanced_buttons1 eq '0'>
					theme_advanced_buttons1 : '',
				<cfelseif arguments.theme_advanced_buttons1 neq 'default'>
					theme_advanced_buttons1: '#arguments.theme_advanced_buttons1#',
				<cfelse>
					theme_advanced_buttons1_add: '#arguments.theme_advanced_buttons1_add#',
				</cfif>
				
				<cfif arguments.theme_advanced_buttons2 eq '0'>
					theme_advanced_buttons2 : '',
				<cfelseif arguments.theme_advanced_buttons2 neq 'default'>
					theme_advanced_buttons2: '#arguments.theme_advanced_buttons2#',
				<cfelse>
					theme_advanced_buttons2_add_before: '#arguments.theme_advanced_buttons2_add_before#',
					theme_advanced_buttons2_add: '#arguments.theme_advanced_buttons2_add#',
				</cfif>
				
				<cfif arguments.theme_advanced_buttons3 eq '0'>
					theme_advanced_buttons3 : '',
				<cfelseif arguments.theme_advanced_buttons3 neq 'default'>
					theme_advanced_buttons3: '#arguments.theme_advanced_buttons3#',
				<cfelse>
					theme_advanced_buttons3_add_before: '#arguments.theme_advanced_buttons3_add_before#',
					theme_advanced_buttons3_add: '#arguments.theme_advanced_buttons3_add#',
				</cfif>
				
				content_css : '#arguments.cssfile#',
				theme_advanced_styles : "#arguments.theme_advanced_styles#",
				paste_auto_cleanup_on_paste : true,
				paste_convert_pageheaders_to_strong : false,
				paste_strip_class_attributes : 'all',
				paste_remove_spans : false,
				paste_remove_styles : false,
/*
				force_br_newlines : true,
				force_p_newlines : false,
*/
				relative_urls : false,
				gecko_spellcheck : true,
				convert_urls : true,
				theme_advanced_statusbar_location : '#arguments.theme_advanced_statusbar_location#',
				theme_advanced_path : #arguments.theme_advanced_path#,
				theme_advanced_resizing_use_cookie : true,
				theme_advanced_resizing : #arguments.resizing#,
				theme_advanced_resize_horizontal : false,
				theme_advanced_toolbar_location : 'top',
				theme_advanced_toolbar_align : 'left',
				extended_valid_elements : '#extended_valid_elements#',
				forced_root_block : '',
				external_link_list_url : '#external_link_list_url#',
				dialog_type : 'modal',
				body_id : '#body_id#'
			}];			
			tinyMCE.settings = configArray#arguments.element#[0];
			tinyMCE.execCommand('mceAddControl', false, '#arguments.element#');
			</script>
		</cfoutput>
	</cffunction>

</cfcomponent>