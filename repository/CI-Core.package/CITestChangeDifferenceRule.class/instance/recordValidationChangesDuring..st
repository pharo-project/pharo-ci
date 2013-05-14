validation
recordValidationChangesDuring: aBlock
	self preLoadValidate.
	self inform: 'Loading change.'.
	
	[[ loadTime := aBlock timeToRun ]
		on: Error, Warning do: [ :error |
			^ self addError: (String streamContents: [ :stream |
				stream << 'Could not apply change: '; print: error.
				error signalerContext shortDebugStackOn: stream ])]
	] on: Exception do: [ :e|
		self inform: '   loading signalled ', e asString.
		e pass ].
	
	self inform: 'Loaded change in ', loadTime asString, ' ms'.
	self 
		postLoadValidate;
		removeFalsePositives.