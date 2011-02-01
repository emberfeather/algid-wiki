<cfcomponent extends="algid.inc.resource.base.service" output="false">
<cfscript>
	public component function getPage( required string repositoryPath, required string treeName, required string pageName ) {
		var git = '';
		var item = '';
		var observer = getPluginObserver('wiki', 'wiki');
		var page = getModel('wiki', 'page');
		var tree = '';
		
		git = variables.transport.theApplication.factories.transient.getGitForScm(arguments.repositoryPath);
		tree = git.getTree(arguments.treeName);
		item = tree.getItem(arguments.pageName);
		
		page.setFileName(item.getFullName());
		page.setRaw(item.read());
		
		observer.afterRepositoryRead(variables.transport, page);
		
		return page;
	}
</cfscript>
</cfcomponent>
