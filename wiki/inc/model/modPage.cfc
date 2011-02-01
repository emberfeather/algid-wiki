<cfcomponent extends="algid.inc.resource.base.model" output="false">
	<cffunction name="init" access="public" returntype="component" output="false">
		<cfargument name="i18n" type="component" required="true" />
		<cfargument name="locale" type="string" default="en_US" />
		
		<cfset super.init(arguments.i18n, arguments.locale) />
		
		<!--- Page --->
		<cfset add__attribute(
			attribute = 'page'
		) />
		
		<!--- Title --->
		<cfset add__attribute(
			attribute = ' title'
		) />
		
		<!--- Type --->
		<cfset add__attribute(
			attribute = 'type'
		) />
		
		<!--- HTML --->
		<cfset add__attribute(
			attribute = 'html'
		) />
		
		<!--- Raw --->
		<cfset add__attribute(
			attribute = 'raw'
		) />
		
		<!--- Set the bundle information for translation --->
		<cfset add__bundle('plugins/wiki/i18n/inc/model', 'modPage') />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="setRaw" access="public" returntype="void" output="false">
		<cfargument name="value" type="string" required="true" />
		
		<cfset this.setHtml(arguments.value) />
		<cfset super.setRaw(arguments.value) />
	</cffunction>
	
	<cffunction name="toHtml" access="public" returntype="string" output="false">
		<cfreturn this.getHtml() />
	</cffunction>
</cfcomponent>
