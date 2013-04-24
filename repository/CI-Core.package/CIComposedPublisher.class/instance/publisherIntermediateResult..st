publishing
publisherIntermediateResult: aCIValidationResult
	
	self publishers do: [ :publisher | 
			publisher publisherIntermediateResult: aCIValidationResult ].
	