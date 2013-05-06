action-test
testConfiguration
	self inform: 'Testing configigurationOf  ', issue id asString.
	stdout nextPutAll: issue publicUrl; lf.
	
	^ manager validateChange: issue