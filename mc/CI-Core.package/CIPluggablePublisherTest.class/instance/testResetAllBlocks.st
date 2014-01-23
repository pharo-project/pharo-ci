tests
testResetAllBlocks
	| publisher published |
	
	published := 0.
	publisher := CIPluggablePublisher new.
	
	publisher resetAllBlocks: [ published := published + 1 ].
	
	self assert: published = 0.
	publisher 	publishBeforeValidation: #aValue.
	self assert: published = 1.
	
	publisher publishChangeNotFound: #aValue.
	self assert: published = 2.
	
	publisher publishIntermediateResult: #aValue.
	self assert: published = 3.
	
	publisher publishValidationResult: #aValue.
	self assert: published = 4.