accessing
newValidationRule
	^ CITestRule block: [ :change| 
		self newValidationResult ]