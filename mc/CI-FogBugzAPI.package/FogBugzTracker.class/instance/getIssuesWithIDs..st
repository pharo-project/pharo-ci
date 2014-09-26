querying
getIssuesWithIDs: ids
	^ ids collect: [ :id | self getIssueWithID: id ]