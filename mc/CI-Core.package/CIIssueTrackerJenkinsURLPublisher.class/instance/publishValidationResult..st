publishing
publishValidationResult: aCIValidationResult

	self 
		publishValidationResult: aCIValidationResult
		message: (self buildMessage: aCIValidationResult).
		
	[ self publishHTMLResult: aCIValidationResult ] 
		on: Error
		do: [ :error | 
			self inform: 'Error happened while publishing html report: ', error messageText.
			self publishValidationCrash: error ].