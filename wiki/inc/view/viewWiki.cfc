<cfcomponent extends="algid.inc.resource.base.view" output="false">
	<cffunction name="displayPage" access="public" returntype="string" output="false">
		<cfargument name="page" type="component" required="true" />
		
		<cfset var html = '' />
		
		<cfsavecontent variable="html">
			<cfoutput>
				<div class="wiki page">
					#arguments.page.toHtml()#
				</div>
				
				<div class="wiki about">
					Last edited by <strong>Unknown</strong>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn html />
	</cffunction>
</cfcomponent>
