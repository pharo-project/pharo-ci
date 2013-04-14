validation
validateChange: aCIChange
	| result |
	self asertLoadable: aCIChange.
	result := CIValidationResult change: aCIChange.
	self rules do: [ :validationRule|
		result := result, (validationRule change: aCIChange) validate ].
	^ result