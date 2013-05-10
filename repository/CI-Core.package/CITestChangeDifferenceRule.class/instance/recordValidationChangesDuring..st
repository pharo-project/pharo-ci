validation
recordValidationChangesDuring: aBlock
	self preLoadValidate.
	[ loadTime := aBlock timeToRun ]
		on: Error do: [ :error |
			^ self addError: 'Could not apply change: ', error asString ] .
	self 
		postLoadValidate;
		removeFalsePositives.