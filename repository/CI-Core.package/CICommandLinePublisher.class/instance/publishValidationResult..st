publishing
publishValidationResult: aCIValidationResult
	
	aCIValidationResult	isSuccess 
			ifTrue: [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	(aCIValidationResult messages isNil or: [ aCIValidationResult errors isEmpty ])
		ifFalse: [ self publishMessages: aCIValidationResult ].