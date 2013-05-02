tests
testHarden
	| aResult aModifyResult  aRule |
	
	aRule :=[ :change | CIValidationResult failure: 'test' ] asCIValidationRule .
	aResult :=  aRule validate.
	aModifyResult := ((self ruleClass) rule: aRule) validate.
	
	self assert: aResult failures isEmpty not.
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.
	
	self assert: aModifyResult failures size equals: 0.	
	self assert: aModifyResult messages size equals: 0.	
	self assert: aModifyResult warnings isEmpty not.	
		