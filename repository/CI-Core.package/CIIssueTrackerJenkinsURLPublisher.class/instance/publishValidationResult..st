publishing
publishValidationResult: aCIValidationResult

	self publishHTMLResult: aCIValidationResult.
	
	super 
		publishValidationResult: aCIValidationResult
		message: (self buildMessage: aCIValidationResult)