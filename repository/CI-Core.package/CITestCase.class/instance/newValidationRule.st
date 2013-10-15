accessing
newValidationRule
	^ CIMockRule block: [ :change| 
		self newValidationResult ]