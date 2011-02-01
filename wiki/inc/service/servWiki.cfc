<cfcomponent extends="algid.inc.resource.base.service" output="false">
<cfscript>
	public component function init( required struct transport ) {
		super.init(arguments.transport);
		
		variables.git = variables.transport.theApplication.factories.transient.getGitForScm();
		
		return this;
	}
	
	public component function getPage( required string repositoryPath, required string treeName, required string pageName ) {
		var item = '';
		var observer = getPluginObserver('wiki', 'wiki');
		var page = getModel('wiki', 'page');
		var repository = '';
		var tree = '';
		
		repository = git.getRepository(arguments.repositoryPath);
		tree = repository.getTree(arguments.treeName);
		item = tree.getItem(arguments.pageName);
		
		page.setFileName(item.getFullName());
		page.setRaw(item.read());
		
		observer.afterRepositoryRead(variables.transport, page);
		
		return page;
	}
</cfscript>
</cfcomponent>
