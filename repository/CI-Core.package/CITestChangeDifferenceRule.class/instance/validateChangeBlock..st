validation
validateChangeBlock: aChangeBlock
	[ 
		self recordEnvironmentChangeDuring: [
			self recordValidationChangesDuring: aChangeBlock ]
	] on: Error,Exit do: [ :e | self addError: e ].
	
	^ self validationResult