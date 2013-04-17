tests
testChangeImpact: aChangeBlock
	[ 
		self preRunTests.
		loadTime := aChangeBlock timeToRun.
		self runAllTests.
		self removeFalseErrors
	] on: Error	do: [ :e | self addError: e ].
	
	^ self buildValidationResult