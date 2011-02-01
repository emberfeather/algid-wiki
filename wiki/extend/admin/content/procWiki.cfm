<cfset servWiki = services.get('wiki', 'wiki') />

<cfset repository = theUrl.search('repository') />
<cfset repository = (len(repository) ? repository : 'algid') />
<cfset ref = theUrl.search('ref') />
<cfset ref = (len(ref) ? ref : 'master') />
<cfset pageName = theUrl.search('page') />
<cfset pageName = (len(pageName) ? pageName : 'Home') />

<cfset page = servWiki.getPage(expandPath('/storage/wiki/repos/' & repository), ref, pageName) />
