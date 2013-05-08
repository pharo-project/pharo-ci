tests
testMessageOrFailure

	| ruleOne ruleTwo aResult validatedRuleOne validatedRuleTwo |
	
	validatedRuleOne := false.
	validatedRuleTwo := false.
	
	ruleOne := [ :change |
		validatedRuleOne := true.
		CIValidationResult message: 'test message' ] asCIValidationRule.
	ruleTwo := [ :change | 
		validatedRuleTwo := true. 
		CIValidationResult failure: 'test failure'] asCIValidationRule.
	
	aResult := (ruleOne | ruleTwo) validate: self newChange.
	self assert: validatedRuleOne.
	self deny: validatedRuleTwo.
	
	self assert: aResult failures size equals: 0.
	self assert: aResult messages size equals: 1.	
	self assert: aResult warnings size equals: 0.