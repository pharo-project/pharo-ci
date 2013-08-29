publishing
publishFailure: aCIValidationResult 

	VTermOutputDriver stderr 
		red: (aCIValidationResult change name asString, ' >> test failure report'); lf;
		red: '==============================================================================='; lf.
	
	aCIValidationResult errors do: [ :aFailure |
		VTermOutputDriver stderr red: aFailure asString;lf ]