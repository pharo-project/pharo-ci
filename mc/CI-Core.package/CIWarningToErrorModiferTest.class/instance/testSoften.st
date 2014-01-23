tests
testSoften
	| aRule aSoftenedRule result |
	
	aRule := [ :change | CIValidationResult error: 'failure' ] asCIValidationRule.
	aSoftenedRule := aRule soften.
	result := aSoftenedRule validate: self newChange.
	
	self deny: aRule validate isSuccess.
	self assert: result isSuccess description: 'Ensure tests is successful'.
	
	self assert: result errors isEmpty description: 'Ensure there is no errors for the validation'.
	self assert: result warnings size equals: 1.
	self assert: result warnings first equals: 'failure'.