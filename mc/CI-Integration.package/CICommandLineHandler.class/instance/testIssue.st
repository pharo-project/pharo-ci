action-test
testIssue
	self inform: 'Testing Issue ', issue id asString.
	stdout nextPutAll: issue publicUrl; lf.
	
	^self manager validateChange: issue