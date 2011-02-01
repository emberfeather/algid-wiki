component extends="algid.inc.resource.base.event" {
	/**
	 * Parse the wiki to generate the html.
	 */
	public void function afterRepositoryRead( required struct transport, required component page ) {
		var html = '';
		var parser = '';
		var type = '';
		
		if(arguments.page.getType() eq '') {
			return;
		}
		
		// Get the parser type for page
		type = 'parser' & arguments.page.getType();
		
		// If we know what parser to use then use it
		if(arguments.transport.theApplication.managers.singleton.has(type)) {
			parser = arguments.transport.theApplication.managers.singleton.get(type);
			
			// Parse the raw markup
			html = parser.toHtml(arguments.page.getRaw());
			
			// Store it as the html page
			arguments.page.setHtml(html);
		}
	}
}
