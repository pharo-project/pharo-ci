publishing
publishValidationResult: aCIValidationResult
	"Publish the result of validation"
	
	aCIValidationResult	isSuccess 
			ifTrue: [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].