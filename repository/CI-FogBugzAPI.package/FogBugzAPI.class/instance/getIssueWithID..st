protocol-query
getIssueWithID: id

	^ (self getIssuesForQuery: 'ixbug:',(id asString)) first