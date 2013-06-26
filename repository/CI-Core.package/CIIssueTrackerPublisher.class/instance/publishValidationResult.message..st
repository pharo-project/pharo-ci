publishing
publishValidationResult: aCIValidationResult message: aString

	aCIValidationResult	isSuccess 
		ifTrue: [ self publishSuccess: aCIValidationResult message: aString ]
		ifFalse: [ self publishFailure: aCIValidationResult message: aString ]