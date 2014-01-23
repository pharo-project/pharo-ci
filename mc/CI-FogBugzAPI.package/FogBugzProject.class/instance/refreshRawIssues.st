accessing
refreshRawIssues
	| arguments |
	
	arguments := Dictionary new
					at: 'cmd' put: 'search';
					at: 'q' put: 'status:open project:', self title asString;
					at: 'cols' put: 'sTitle,sCategory,ixProject,sProject,events,tags,sFixFor,dtLastUpdated,dtOpened,dtResolved,dtClosed,sStatus';
					yourself.
					
	^ rawIssues := self tracker sendRequestWithArguments:arguments.