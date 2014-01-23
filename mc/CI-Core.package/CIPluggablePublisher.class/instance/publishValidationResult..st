publishing
publishValidationResult: aCIValidationResult
	self validationResultBlock ifNotNil: [ 
		self validationResultBlock cull: aCIValidationResult ]