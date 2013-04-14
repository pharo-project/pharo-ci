protocol-query
getIssueWithID: id

	^ (self getIssuesForQuery: 'ixbug:', id asString)
		ifEmpty: [ 
			FogBugzCaseNotFound new 
				id: id; 
				signal ]
		ifNotEmpty: [ :cases | cases first ]