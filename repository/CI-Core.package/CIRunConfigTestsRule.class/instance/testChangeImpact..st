tests
testChangeImpact: aChangeBlock
"self halt."
	[ 
		loadTime := aChangeBlock timeToRun.
		self runAllTests.
		self removeFalseErrors
	] on: Error	do: [ :e | self addError: e ].
	
	^ self buildValidationResult