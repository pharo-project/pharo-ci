protocol-query
getIssuesForQuery: query
	| arguments rawIssues |
	
	arguments := Dictionary new
					at: 'cmd' put: 'search';
					at: 'q' put: query;
					at: 'cols' put: 'sTitle,sCategory,sProject,events,tags';
					yourself.
					
	rawIssues := self sendRequestWithArguments:arguments.
	^ FogBugzIssue buildIssuesFrom: rawIssues