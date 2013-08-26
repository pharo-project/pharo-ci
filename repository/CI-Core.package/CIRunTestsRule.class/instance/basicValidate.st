validation
basicValidate
	| suite result |
	
	suite := self testSuite.
	result := CITestResult new.
	result maxTest: suite tests size.
	
	suite run: result.
	
	self testResult: result.
	^ self validationResult