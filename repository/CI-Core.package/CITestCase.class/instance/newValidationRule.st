accessing
newValidationRule
	^ CIBlockRule block: [ :change| 
		self newValidationResult ]