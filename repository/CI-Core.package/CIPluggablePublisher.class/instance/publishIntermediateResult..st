publishing
publishIntermediateResult: aCIValidationResult
	self intermediateResultBlock ifNotNil: [ 
		self intermediateResultBlock cull: aCIValidationResult ]