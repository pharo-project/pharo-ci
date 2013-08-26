publishing
publishIntermediateResult: aCIValidationResult
	
	self publishers do: [ :publisher | 
			publisher publishIntermediateResult: aCIValidationResult ].
	