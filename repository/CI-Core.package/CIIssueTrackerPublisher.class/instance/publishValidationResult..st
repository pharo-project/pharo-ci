publishing
publishValidationResult: aCIValidationResult

	aCIValidationResult	isSuccess 
		ifTrue: [ self publishSuccess: aCIValidationResult ]
		ifFalse: [ self publishFailure: aCIValidationResult ]