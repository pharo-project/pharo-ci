publishing
publishValidationResult: aCIValidationResult

	[ self publishHTMLResult: aCIValidationResult ] 
		on: Error
		do: [ :error | ^ self publishValidationCrash: error ].
	
	self 
		publishValidationResult: aCIValidationResult
		message: (self buildMessage: aCIValidationResult)