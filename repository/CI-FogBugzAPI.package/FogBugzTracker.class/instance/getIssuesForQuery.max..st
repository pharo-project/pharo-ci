protocol-query
getIssuesForQuery: query max: maxSize
	| arguments rawIssues |
	
	arguments := Dictionary new
					at: 'cmd' put: 'search';
					at: 'q' put: query;
					at: 'cols' put: 'sTitle,sCategory,ixProject,sProject,events,tags,sFixFor,dtLastUpdated,dtOpened,dtResolved,dtClosed,sStatus';
					at: 'max' put: maxSize asString;
					yourself.
					
	rawIssues := self sendRequestWithArguments:arguments.
	^ FogBugzCase buildIssuesFrom: rawIssues