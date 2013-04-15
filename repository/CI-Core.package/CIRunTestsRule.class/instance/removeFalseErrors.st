testing
removeFalseErrors
	testResult 
		ifNil: [ ^ self ].
	self halt.
	testFailures := self 
		removeFalsePositives: previousTestResult failures 
		from: testResult failures.
		
	testErrors := self 
		removeFalsePositives: previousTestResult errors 
		from: testResult errors.