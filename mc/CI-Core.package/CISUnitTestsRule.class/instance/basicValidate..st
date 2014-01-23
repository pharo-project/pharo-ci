validation
basicValidate: sunitTestResult
	| suite |
	
	suite := self testSuite.
	sunitTestResult maxTest: suite tests size.
	
	suite run: sunitTestResult.
	
	self testResult: sunitTestResult.
	^ self validationResult