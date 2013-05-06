tests
testShouldContinueMessageAndFailure

	| ruleOne ruleTwo aResult |
	
	ruleOne := [ :change | CIValidationResult failure: 'test failure' ] asCIValidationRule.
	ruleTwo := [ :change | CIValidationResult message: 'test message' ] asCIValidationRule.
	aResult := (CIAndRule with: ruleTwo with: ruleOne) validate.
	
	"in case of the message is handle first, it should continue to run tests, that's why we get 1 message and 1 failure"
	self assert: aResult failures size equals: 1.
	self assert: aResult messages size equals: 1.	
	self assert: aResult warnings size equals: 0.