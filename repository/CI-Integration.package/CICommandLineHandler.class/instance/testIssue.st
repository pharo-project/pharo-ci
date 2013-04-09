action-test
testIssue
	self inform: 'Testing issue ', issue id asString.
	stdout nextPutAll: issue publicUrl; lf.
	
	self issueChecker validateCase: issue