<cfcomponent extends="algid.inc.resource.base.service" output="false">
<cfscript>
	public string function convertPageNameToFileName(required string pageName) {
		var fileName = '';
		
		fileName = replaceList(arguments.pageName, ' ,/', '-,-');
		
		return fileName;
	}
	
	public component function getPage( required string repositoryPath, required string treeName, required string pageName ) {
		var git = '';
		var item = '';
		var observer = getPluginObserver('wiki', 'wiki');
		var page = getModel('wiki', 'page');
		var tree = '';
		
		git = variables.transport.theApplication.factories.transient.getGitForScm(arguments.repositoryPath);
		tree = git.getTree(arguments.treeName);
		item = tree.getItem(convertPageNameToFileName(arguments.pageName & '.md'));
		
		page.setFileName(item.getFullName());
		page.setRaw(item.read());
		
		observer.afterRepositoryRead(variables.transport, page);
		
		return page;
	}
</cfscript>
</cfcomponent>
