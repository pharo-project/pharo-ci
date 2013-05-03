tests
testShouldContinueFailureOrMessage

	| ruleOne ruleTwo aResult |
	
	ruleOne := [ :change | CIValidationResult failure: 'test failure' ] asCIValidationRule.
	ruleTwo := [ :change | CIValidationResult message: 'test message' ] asCIValidationRule.
	aResult := (CIAndRule with: ruleOne with:ruleTwo) validate.
	
	self assert: aResult failures size equals: 1.
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.