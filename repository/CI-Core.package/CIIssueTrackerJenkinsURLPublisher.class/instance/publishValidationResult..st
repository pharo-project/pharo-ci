publishing
publishValidationResult: aCIValidationResult

	self publishHTMLResult: aCIValidationResult.
	
	self 
		publishValidationResult: aCIValidationResult
		message: (self buildMessage: aCIValidationResult)