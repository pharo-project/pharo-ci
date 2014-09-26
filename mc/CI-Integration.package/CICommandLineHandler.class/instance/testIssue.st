action-test
testIssue
	self inform: 'Testing ', issue typeName,' ', issue id asString.
	stdout nextPutAll: issue publicUrl asString; lf.
	
	^self manager validateChange: issue