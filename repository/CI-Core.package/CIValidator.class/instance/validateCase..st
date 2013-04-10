validation
validateCase: aCase
	| result |
	result := CIValidationResult case: aCase.
	self rules do: [ :validationRule|
		result := result, (validationRule case: aCase) validate ].
	^ result