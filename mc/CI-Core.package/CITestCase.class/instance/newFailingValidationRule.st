accessing
newFailingValidationRule
	^ CIMockRule block: [ :change| 
		self newFailingValidationResult ]