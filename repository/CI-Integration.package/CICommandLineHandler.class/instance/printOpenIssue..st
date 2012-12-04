action-list
printOpenIssue: anIssue
	stdout 
		print: anIssue id; tab;
		nextPutAll: anIssue viewUrl; tab;
		nextPutAll: anIssue title; lf