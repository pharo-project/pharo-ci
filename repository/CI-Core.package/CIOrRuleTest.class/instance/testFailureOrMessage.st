tests
testFailureOrMessage

	| ruleOne ruleTwo aResult validatedRuleOne validatedRuleTwo |
	
	validatedRuleOne := false.
	validatedRuleTwo := false.
	
	ruleOne := [ :change |
		validatedRuleOne := true.
		CIValidationResult failure: 'test failure'] asCIValidationRule.
	ruleTwo := [ :change | 
		validatedRuleTwo := true. 
		CIValidationResult message: 'test message' ] asCIValidationRule.
	
	aResult := (ruleOne | ruleTwo) validate: self newChange.
	self assert: validatedRuleOne.
	self assert: validatedRuleTwo.
	
	self assert: aResult errors size equals: 1.
	self assert: aResult messages size equals: 1.	
	self assert: aResult warnings size equals: 0.