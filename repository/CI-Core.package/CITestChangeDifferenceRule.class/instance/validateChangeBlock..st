validation
validateChangeBlock: aChangeBlock
	[ 
		self recordEnvironmentChangeDuring: [
			self recordValidationChangesDuring: [ 
				loadTime := aChangeBlock timeToRun ]]
	] on: Error	do: [ :e | self addError: e ].
	
	^ self validationResult