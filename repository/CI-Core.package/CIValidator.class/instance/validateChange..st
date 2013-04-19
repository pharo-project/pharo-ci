validation
validateChange: aCIChange
	| result |
	self asertLoadable: aCIChange.
	self publishBeforeValidation: aCIChange.
	
	result := CIValidationResult change: aCIChange.
	
	[ self rules do: [ :validationRule | | newResult |
		newResult := (validationRule change: aCIChange) validate.
		self publisherIntermediateResult: newResult.
		result := result, newResult  ].
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result