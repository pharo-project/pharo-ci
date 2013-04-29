validation
basicValidate
	| suite |
	
	suite := TestSuite new.
	
	TestCase allSubclasses 
		select: self selectTestCaseBlock
		thenDo: [ :testClass |
			testClass isAbstract 
				ifFalse: [ suite addTests: testClass suite tests ]].
			
 	self testResult: suite run