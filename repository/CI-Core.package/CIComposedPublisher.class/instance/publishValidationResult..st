publishing
publishValidationResult: aCIValidationResult
	
	self publishers do: [ :publisher | 
			publisher publishValidationResult: aCIValidationResult ].
	