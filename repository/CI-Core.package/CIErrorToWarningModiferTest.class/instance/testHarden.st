tests
testHarden
	| rule hardenedRule result |
	
	rule := [ :change | CIValidationResult warning: 'warning' ] asCIValidationRule .
	hardenedRule := rule harden.
	
	result := hardenedRule validate: self newChange.
	
	self assert: result warnings isEmpty.
	self assert: result errors first equals: 'warning'.