private
getIssuesForQuery: query
	| arguments rawIssues |
	
	arguments := Dictionary new
					at: 'cmd' put: 'search';
					at: 'q' put: query;
					at: 'cols' put: 'sTitle,sCategory,ixProject,sProject,events,tags,sFixFor,dtLastUpdated,dtOpened,dtResolved,dtClosed,sStatus,configurationof,configurationversion,preload,postload';
					yourself.
					
	rawIssues := self sendRequestWithArguments: arguments.
	^ FogBugzCase 
		buildIssuesFrom: rawIssues
	 	tracker: self