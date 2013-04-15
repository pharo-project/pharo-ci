validation
validateChange: aCIChange
	| result |
	
	self asertLoadable: aCIChange.
	self publishBeforeValidation: aCIChange.
	
	result := CIValidationResult change: aCIChange.
	"fuel bug prevents us from serializing all values directly, need to handle the globals first"
	result := result second.
	
	[ self rules do: [ :validationRule|
		result := result, (validationRule change: aCIChange) validate ].
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result