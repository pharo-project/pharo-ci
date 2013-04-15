validation
validateChange: aCIChange
	| result |
	
	self asertLoadable: aCIChange.
	self publishBeforeValidation: aCIChange.
	
	result := CIValidationResult change: aCIChange.
	[ self rules do: [ :validationRule|
		result := result, (validationRule change: aCIChange) validate ].
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result