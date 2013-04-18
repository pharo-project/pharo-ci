testing
removeFalseErrors
	| collectionOfWarnings |
	testResult 
		ifNil: [ ^ self ].
	collectionOfWarnings := self 
		removeFalsePositives: previousTestResult  
		from: testResult .
	collectionOfWarnings do:[ :warning |
		self addWarning: warning].