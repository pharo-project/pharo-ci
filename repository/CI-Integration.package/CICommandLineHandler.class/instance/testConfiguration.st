action-test
testConfiguration
	self inform: 'Testing ConfigurationOf  ', issue id asString.
	stdout nextPutAll: issue publicUrl; lf.
	
	^ manager validateChange: issue