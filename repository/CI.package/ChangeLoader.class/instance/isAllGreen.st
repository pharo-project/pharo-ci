testing
isAllGreen

	self runAllTests.
	^ testResult failures isEmpty and: [ testResult errors isEmpty ]