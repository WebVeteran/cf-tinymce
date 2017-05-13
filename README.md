## Synopsis

A ColdFusion function to create tinyMCE instances - using the CFN and allowing for multiple instances per page.
It's a pretty good base with decent defaults.

## Code Example

To display an RTE instance filled with bio information from a query named 'read':

```
<cfoutput>
#application.formutils.tinymce4(
	element='bio',
	content=read.bio
)#
</cfoutput>
```

This assumes you cached the function 'tinymce4' into an application component called 'formutils'.
The above is the simplest way to display tinyMCE, however there are 22 options to cusomtize the display on a per-instance basis.

## Live Demo

For a live demo visit http://wvcsm.webveteran.net/ .

## Screenshot

Screenshot shows an implimentation with more plugins: Responsive File Manager, Bootstrap Elements, and codeMirror.