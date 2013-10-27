publishing
publishValidationResult: aCIValidationResult
	
	VTermOutputDriver stderr 
		<< '================================================================================'; lf;
		<< 'Validation Report: '; << aCIValidationResult change asString; lf;
		<< '================================================================================'; lf.
	
	aCIValidationResult	isSuccess 
			ifTrue:  [ self publishSuccess: aCIValidationResult ]
			ifFalse: [ self publishFailure: aCIValidationResult ].
	
	aCIValidationResult messages isEmpty
		ifFalse: [ self publishMessages: aCIValidationResult ].