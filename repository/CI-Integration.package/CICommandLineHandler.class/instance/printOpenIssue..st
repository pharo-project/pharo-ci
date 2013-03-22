action-list
printOpenIssue: anIssue

	stdout 
		print: anIssue id; tab;
		nextPutAll: anIssue publicUrl; tab;
		nextPutAll: anIssue title; lf