tests
testSoften
	| aRule aSoftenedRule result |
	
	aRule := [ :change | CIValidationResult failure: 'failure' ] asCIValidationRule.
	aSoftenedRule := aRule soften.
	result := aSoftenedRule validate.
	
	self deny: aRule validate isSuccess.
	self assert: result isSuccess.
	
	self assert: result failures isEmpty.
	self assert: result warnings size equals: 1.
	self assert: result warnings first equals: 'failure'.