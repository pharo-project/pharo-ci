tests
testNothingOrFailure

	| ruleOne ruleTwo aResult validatedRuleOne validatedRuleTwo |
	
	validatedRuleOne := false.
	validatedRuleTwo := false.
	
	ruleOne := [ :change |
		validatedRuleOne := true.
		CIValidationResult new] asCIValidationRule.
	ruleTwo := [ :change | 
		validatedRuleTwo := true. 
		CIValidationResult message: 'test message' ] asCIValidationRule.
	
	aResult := (ruleOne | ruleTwo) validate: self newChange.
	self assert: validatedRuleOne.
	self deny: validatedRuleTwo.
	
	self assert: aResult failures size equals: 0.
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.