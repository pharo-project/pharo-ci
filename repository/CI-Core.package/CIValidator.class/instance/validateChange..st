validation
validateChange: aCIChange
	| result |
	result := CIValidationResult change: aCIChange.
	self rules do: [ :validationRule|
		result := result, (validationRule change: aCIChange) validate ].
	^ result