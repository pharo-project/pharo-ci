publishing
publishValidationResult: aCIValidationResult

	aCIValidationResult	isSuccess 
			ifTrue: [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	(aCIValidationResult messages isNil or: [ aCIValidationResult failures isEmpty ])
		ifFalse: [ self publishMessages: aCIValidationResult ].