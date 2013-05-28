validation
validateChange: aCIChange
	| result |
	self publishBeforeValidation: aCIChange.
	rules := CIAndRule with: aCIChange changeValidationRule withRules: self rules rules.
	self rules change: aCIChange.
	result := CIValidationResult change: aCIChange.
	
	[ "Since we used CIComposedRule as default rules, the next instructions are deprecated
	
		self rules do: [ :validationRule | | newResult |
		newResult := (validationRule validate: aCIChange).
		self publishIntermediateResult: newResult.
		result := result, newResult ]."
		result := self rules validate.
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result