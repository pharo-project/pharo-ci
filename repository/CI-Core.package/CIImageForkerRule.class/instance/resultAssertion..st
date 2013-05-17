result handling main image
resultAssertion: result
	self 
		assert: (result isKindOf: CIValidationResult)
		description: 'Expected a CIValidationResult but got a ', result class name.