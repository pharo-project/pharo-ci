validation
validateChangeBlock: aChangeBlock
	[ 
		self recordEnvironmentChangeDuring: [
			self recordValidationChangesDuring: [ 
				loadTime := aChangeBlock timeToRun ]]
	] on: Error,Halt,Exit do: [ :e | self addError: e ].
	
	^ self validationResult