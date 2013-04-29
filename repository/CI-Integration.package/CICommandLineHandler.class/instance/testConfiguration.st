action-test
testConfiguration
	self inform: 'Testing config ', issue id asString.
	stdout nextPutAll: issue publicUrl; lf."
	self issueChecker validator: CIValidator configurationTest ."
	^self issueChecker validateChange: issue