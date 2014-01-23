validation
validateChangeBlock: aChangeBlock
	[ 
		self recordEnvironmentChangeDuring: [
			self recordValidationChangesDuring: aChangeBlock ]
	] on: Error, Exit, Deprecation do: [ :error | 
		self inform: 'Could validate change: ', error asString.
		self addError: error freeze ].
	
	^ self validationResult