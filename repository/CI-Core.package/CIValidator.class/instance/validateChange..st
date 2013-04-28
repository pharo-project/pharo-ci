validation
validateChange: aCIChange
	| result |
	self asertLoadable: aCIChange.
	self publishBeforeValidation: aCIChange.
	
	result := CIValidationResult change: aCIChange.
	
	[ self rules do: [ :validationRule | | newResult |
		newResult := (validationRule validate: aCIChange).
		self publishIntermediateResult: newResult.
		result := result, newResult  ].
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result