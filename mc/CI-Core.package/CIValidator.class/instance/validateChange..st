validation
validateChange: aCIChange
	| result rules |
	self publishBeforeValidation: aCIChange.
	
	rules :=  aCIChange changeValidationRule & self rule.
	result := CIValidationResult change: aCIChange.
	
	[ 
		result := rules validate: aCIChange.
	] ensure: [ 
		self publishValidationResult: result ].
	
	^ result