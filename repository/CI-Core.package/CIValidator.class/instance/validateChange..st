validation
validateChange: aCIChange
	| result |
	self publishBeforeValidation: aCIChange.
	
	rule :=  aCIChange changeValidationRule & self rule.
	result := CIValidationResult change: aCIChange.
	
	[ 
		result := rule validate: aCIChange.
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result