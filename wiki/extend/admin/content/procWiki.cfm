<cfset servWiki = services.get('wiki', 'wiki') />

<cfset page = servWiki.getPage(expandPath('/storage/wiki/repos/algid'), 'develop', 'Home.md') />
