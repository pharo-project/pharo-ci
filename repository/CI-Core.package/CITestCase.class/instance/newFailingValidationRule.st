accessing
newFailingValidationRule
	^ CIBlockRule block: [ :change| 
		self newFailingValidationResult ]