action-test
testIssue
	self inform: 'Testing issue ', change id asString.
	stdout nextPutAll: change publicUrl; lf.
	
	self issueChecker validateChange: change