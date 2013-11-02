protocol-query
getIssuesWithIDs: ids
	^ ids collect: [ :id | self getIssueWithID: id ]