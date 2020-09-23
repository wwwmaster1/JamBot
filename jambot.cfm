<cfapplication name = "JamBot" applicationTimeout = #CreateTimeSpan(0,1,0,0)# />
<cfprocessingdirective suppresswhitespace="Yes">

<CFIF NOT structKeyExists(url, "jam")>
	<!--- Do nothing, it's a bad request --->
<CFELSEIF NOT structKeyExists(url, "section")>
	<CFIF structKeyExists(Application,"jam" & URL.jam)>
		<CFOUTPUT>#Evaluate("Application.jam" & URL.jam)#</CFOUTPUT>
	</CFIF>
<CFELSEIF isNumeric(URL.section)>
	<cflock scope="Application" timeout="3" type="Exclusive"> 
		<cfset "Application.jam#URL.jam#" = URL.section+1 />
	</cflock>
<CFELSE>
	<!--- Do nothing, it's a bad request --->
</CFIF>
	
</cfprocessingdirective>