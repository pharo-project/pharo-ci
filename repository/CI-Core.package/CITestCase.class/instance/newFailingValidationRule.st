accessing
newFailingValidationRule
	^ CITestRule block: [ :change| 
		self newFailingValidationResult ]