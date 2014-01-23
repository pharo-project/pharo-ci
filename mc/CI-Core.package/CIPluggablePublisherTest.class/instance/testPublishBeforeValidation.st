tests
testPublishBeforeValidation
	| publisher publishedSomethingElse publishedBeforeValidation |
	
	publishedSomethingElse := false.
	publishedBeforeValidation := false.
	publisher := CIPluggablePublisher block: [ publishedSomethingElse := true ].
	publisher beforeValidationBlock: [ publishedBeforeValidation := true ].
	
	publisher publishBeforeValidation: #anObject.
	self assert: publishedBeforeValidation  description: 'Ensure the validation'.
	self deny: publishedSomethingElse.