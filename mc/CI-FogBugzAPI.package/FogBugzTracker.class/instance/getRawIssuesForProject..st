querying
getRawIssuesForProject: aString 
	| arguments |
	
	arguments := Dictionary new
		at: 'cmd' put: 'search';
		at: 'q' put: 'status:open project:', aString;
		at: 'cols' put: 'sTitle,sCategory,ixProject,sProject,events,tags,sFixFor,dtLastUpdated,dtOpened,dtResolved,dtClosed,sStatus';
		yourself.
	
	^ self sendRequestWithArguments: arguments