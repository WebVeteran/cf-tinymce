<cfcomponent>

	<cffunction name="tinyMCE4">
		<cfargument name="body_id" default='wvContent'>
		<cfargument name="body_class" default="contentArea">
		<cfargument name="content" default=''>
		<cfargument name="content_css" default="/includes/css/load.css">
		<cfargument name="cssheight" default='350px'>
		<cfargument name="csswidth" default='100%'>
		<cfargument name="element" default="contents">
		<cfargument name="valid_elements" default="*[*]">
		<cfargument name="extended_valid_elements" default="">
		<cfargument name="link_list" default='/admin/main/tools/pagesJSON.cfm'>
		<cfargument name="changeWarning" default='0'>
		<cfargument name="remove_script_host" default='true'>
		<cfargument name="convert_urls" default='true'>
		<cfargument name="relative_urls" default='false'>
		<cfargument name="menu" default="
				edit: {title: 'Edit', items: 'undo redo | cut copy paste pastetext | selectall | searchreplace'},
					 insert: {title: 'Insert', items: 'charmap insertdatetime hr | anchor nonbreaking pagebreak'},
					 view: {title: 'View', items: 'visualaid visualblocks visualchars | preview print'},
					 format: {title: 'Format', items: 'underline strikethrough superscript subscript | formats'}
		">
		<cfargument name="plugins" default='[
			"advlist anchor autolink charmap code contextmenu fullscreen hr image imagetools lists media print preview pagebreak",
			"nonbreaking paste searchreplace table textcolor visualblocks visualchars wordcount",
			"advlink insertdatetime directionality emoticons template textcolor colorpicker textpattern"
		]'>
		<cfargument name="external_plugins" default='{
					 "advlink": "/includes/packages/tinymce/external_plugins/advlink/plugin.min.js"
			 }'>
		<cfargument name="style_formats" default=''>
		<cfargument name="toolbar_items_size" default='small'>
		<cfargument name="toolbar1" default='formatselect | bold italic removeformat | alignleft aligncenter alignright alignjustify | outdent indent | bullist numlist | advlink unlink anchor image media | table | fullscreen code'>
		<cfargument name="toolbar2" default=''>
		<cfargument name="toolbar3" default=''>
		<cfargument name="toolbar4" default=''>

		<cfif not isdefined("Request.cftinymcebaseloaded")>
			<cfsavecontent variable="tinyHead">
				<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
			</cfsavecontent>
			<cfhtmlhead text="#variables.tinyHead#">
			<cfset Request.cftinymcebaseloaded="1">
		</cfif>

		<cfoutput>
		<script type="text/javascript">
		unsavedChanges=0;
		tinymce.init({

			// GENERAL
			browser_spellcheck : true,
			plugins: #arguments.plugins#,
			selector: "###arguments.element#",
			autosave_ask_before_unload: false,
			resize: "both",

			// MENUS
			menu: {
					 #arguments.menu#
			},

			// CLEANUP
			<cfif arguments.style_formats neq ''>style_formats : #arguments.style_formats#,</cfif>
			block_formats : 'Paragraph=p;Header 2=h2;Header 3=h3;Header 4=h4;Blockquote=blockquote;Address=address;Preformatted=pre;Code=code;Cite=cite',
			<cfif arguments.valid_elements neq ''>valid_elements : '#valid_elements#',</cfif>
			<cfif arguments.extended_valid_elements neq ''>extended_valid_elements : '#extended_valid_elements#',</cfif>
			external_plugins: #external_plugins#,
			fix_list_elements : true,
			forced_root_block : 'p',
			remove_trailing_brs: true,

			// CONTENT STYLE
			<cfif arguments.body_id neq ''>body_id: "#arguments.body_id#",		 </cfif>
			<cfif arguments.body_class neq ''>body_class: "#arguments.body_class#",	 </cfif>
			<cfif arguments.content_css neq ''>content_css: '#arguments.content_css#',</cfif>

			// VISUAL
			visual: true,

			// INTERFACE
			menubar: true,
			toolbar_items_size: '#arguments.toolbar_items_size#',
			toolbar1: "#arguments.toolbar1#",
			toolbar2: "#arguments.toolbar2#",
			toolbar3: "#arguments.toolbar3#",
			toolbar4: "#arguments.toolbar4#",
			width : '#arguments.csswidth#',
			height : '#arguments.cssheight#',

			// URLS
			document_base_url: '',
			convert_urls : #arguments.convert_urls#,
			relative_urls : #arguments.relative_urls#,
			remove_script_host : #arguments.remove_script_host#,

			// CHANGE WARNING
			<cfif arguments.changeWarning eq 1>
				setup: function(editor) {
							 editor.on('change', function(e) {
									 unsavedChanges=1;
							 });
					 },
			</cfif>

			// PLUGINS

				// LINK
				link_list: "#arguments.link_list#",
				target_list: [
						 {title: 'Same Window/Tab', value: '_self'},
						 {title: 'New Window/Tab', value: '_blank'}
					 ],

				 // IMAGE
				image_advtab: true

		});
		</script>
		</cfoutput>

		<cfoutput><textarea name='#arguments.element#' id='#arguments.element#' style='width:#csswidth#; height:#cssheight#; visibility:hidden;'>#arguments.content#</textarea></cfoutput>

	</cffunction>

</cfcomponent>