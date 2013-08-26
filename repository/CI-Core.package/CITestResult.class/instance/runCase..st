running
runCase: aTestCase 
	self increaseTestCount.
	currentTestCase := aTestCase.
	self printTestCase: aTestCase.
	super runCase: aTestCase