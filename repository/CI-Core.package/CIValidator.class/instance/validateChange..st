validation
validateChange: aCIChange
	| result |
	self publishBeforeValidation: aCIChange.
	rules := CIAndRule with: aCIChange changeValidationRule withRules: self rules.
	result := CIValidationResult change: aCIChange.
	
	[ self rules do: [ :validationRule | | newResult |
		newResult := (validationRule validate: aCIChange).
		self publishIntermediateResult: newResult.
		result := result, newResult ].
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result