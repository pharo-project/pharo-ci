validation
recordValidationChangesDuring: aBlock
	self preLoadValidate.
	[ loadTime := aBlock timeToRun ]
		on: Error do: [ :error |
			^ self addError: (String streamContents: [ :stream |
				stream << 'Could not apply change: '; print: error.
				error signalerContext shortDebugStackOn: stream ])] .
	self 
		postLoadValidate;
		removeFalsePositives.