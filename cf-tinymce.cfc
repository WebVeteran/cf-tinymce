<cfcomponent> 

	<cffunction name="tinymce">
		<cfargument name="Vscope" Required=true hint="Used for auto base=loaded detection">
		<cfargument name="cssfile" default="http://www.nikonusa.com/static/css/main.css">
		<cfargument name="theme_advanced_styles" default=''> 
		<cfargument name="theme" default="advanced">
		<cfargument name="element" default="content"> 
		<cfargument name="plugins" default="autosave,spellchecker,style,layer,table,save,advhr,advimage,advlink,emotions,insertdatetime,preview,media,searchreplace,print,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras"> 
		<cfargument name="theme_advanced_buttons1" default="fontselect,fontsizeselect"> 
		<cfargument name="theme_advanced_buttons2" default="forecolor,backcolor,separator,spellchecker,pastetext,pasteword,separator,search,replace,separator"> 
		<cfargument name="theme_advanced_buttons3" default="tablecontrols,separator,media,advhr"> 
		<cfargument name="extended_valid_elements" default="br,a[name|href|target|title|onclick|class],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name|style],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]"> 
		<cfargument name="content" default=''> 
		<cfargument name="csswidth" default='520px'> 
		<cfargument name="cssheight" default='350px'>
		<cfargument name="resizing" default='true'>
		<cfargument name="compress" default='1'>
		<cfargument name="suffix" default=''>
		<cfargument name="path" default='../../../../../media/cms/'>
		<cfargument name="language" default='en'>
		<cfargument name="gecko_spellcheck" default='true'>
		<cfoutput>
		
		<textarea name='#arguments.element#' id='#arguments.element#' style='width:#csswidth#; height:#cssheight#; visibility:hidden;'>#arguments.content#</textarea>
	
		<cfif not isdefined("Arguments.VScope.cftinymcebaseloaded")>
			<cfsavecontent variable="tinyHead">
			<script type="text/javascript" src="/includes/js/tiny_mce/tiny_mce<cfif arguments.compress eq 1>_gzip</cfif>.js"></script>
			<script language="javascript" type="text/javascript">
			tinyMCE<cfif arguments.compress eq 1>_GZ</cfif>.init({
					plugins : '#arguments.plugins#',
					themes : '#arguments.theme#',
					languages : 'en,es',
					disk_cache : true,
					debug : false,
					suffix : '#arguments.suffix#'
			});
			</script>
			</cfsavecontent>
			<cfhtmlhead text="#variables.tinyHead#">
			<cfset Arguments.VScope.cftinymcebaseloaded="1">
		</cfif>	
			
			<script language="javascript" type="text/javascript">
			var configArray#arguments.element# = [{
				mode : 'exact',
				element : "#arguments.element#",
				theme : '#arguments.theme#',
				plugins : '#arguments.plugins#',
				theme_advanced_disable : 'hr',
				theme_advanced_buttons1 : "#theme_advanced_buttons1#",
				theme_advanced_buttons2 : "#theme_advanced_buttons2#",
				theme_advanced_buttons3 : "#theme_advanced_buttons3#",
				content_css : '#arguments.cssfile#',
				theme_advanced_styles : "#arguments.theme_advanced_styles#",
				paste_auto_cleanup_on_paste : true,
				paste_convert_pageheaders_to_strong : false,
				paste_strip_class_attributes : 'all',
				paste_remove_spans : false,
				paste_remove_styles : false,
				force_br_newlines : true,
				force_p_newlines : false,
				relative_urls : false,
				convert_urls : true,
				gecko_spellcheck : #arguments.gecko_spellcheck#,
				theme_advanced_resizing_use_cookie : true,
				theme_advanced_resizing : #arguments.resizing#,
				theme_advanced_resize_horizontal : false,
				theme_advanced_toolbar_location : 'top',
				theme_advanced_toolbar_align : 'left',
				theme_advanced_statusbar_location : 'bottom',
				extended_valid_elements : '#extended_valid_elements#',
				language : '#language#',
				forced_root_block : '',
				theme_advanced_toolbar_location : "bottom",
				theme_advanced_toolbar_align : "center",
				theme_advanced_statusbar_location : 'none',
				entity_encoding : "raw"
			}];			
			tinyMCE.settings = configArray#arguments.element#[0];
			tinyMCE.execCommand('mceAddControl', false, '#arguments.element#');
			</script>
		</cfoutput>
	</cffunction>

</cfcomponent>