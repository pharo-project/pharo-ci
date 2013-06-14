validation
basicValidate
	| suite result |
	
	suite := TestSuite new.
	
	TestCase allSubclasses 
		select: self selectTestCaseBlock
		thenDo: [ :testClass |
			(self defaultSelectTestCaseBlock value: testClass)
				ifTrue: [ 
					testClass isAbstract 
						ifFalse: [ suite addTests: testClass suite tests ]]].
	
	result := 	CITestResult new.
	result maxTest: suite tests size.
 	suite run: result.
	
	self testResult: result.
	^ self validationResult