tests
testChangeImpact: aChangeBlock

	[ 
		loadTime := aChangeBlock timeToRun.
		self runAllTests.
	] on: Error	do: [ :e | self addError: e ].
	
	^ self buildValidationResult