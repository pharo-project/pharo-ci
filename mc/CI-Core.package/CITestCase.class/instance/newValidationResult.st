accessing
newValidationResult
	^ CIValidationResult new
		change: self newChange;
		yourself