validation
basicValidate
	| suite result |
	
	suite := TestSuite new.
	
	TestCase allSubclasses 
		select: self selectTestCaseBlock
		thenDo: [ :testClass |
			testClass isAbstract 
				ifFalse: [ suite addTests: testClass suite tests ]].
	
	result := 	CITestResult new.
	result maxTest: suite tests size.
 	suite run: result.
	self testResult: result.