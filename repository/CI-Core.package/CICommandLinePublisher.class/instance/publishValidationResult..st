publishing
publishValidationResult: aCIValidationResult

	aCIValidationResult	isSuccess 
			ifTrue: [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	(aCIValidationResult messages isNil or: [ self failures isEmpty ])
		ifTrue: [ self publishMessages: aCIValidationResult ].