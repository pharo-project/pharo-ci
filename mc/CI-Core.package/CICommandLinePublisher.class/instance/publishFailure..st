publishing
publishFailure: aCIValidationResult 

	self 
		publishList: aCIValidationResult errors
		title: 'Validation Errors:'
		color: Color red.
	
	self publishWarnings: aCIValidationResult.