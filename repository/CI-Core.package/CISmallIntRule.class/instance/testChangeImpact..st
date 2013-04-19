tests
testChangeImpact: aChangeBlock

	[ 
		loadTime := aChangeBlock timeToRun.
		self addMessage: self runAllTests.
	] on: Error	do: [ :e | self addError: e ].
	
	^ self buildValidationResult