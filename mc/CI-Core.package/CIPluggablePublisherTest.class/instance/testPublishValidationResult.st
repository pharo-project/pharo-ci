tests
testPublishValidationResult
	| publisher publishedSomethingElse published |
	
	publishedSomethingElse := false.
	published := false.
	publisher := CIPluggablePublisher block: [ publishedSomethingElse := true ].
	publisher validationResultBlock: [ published := true ].
	
	publisher publishValidationResult: #anObject.
	self assert: published.
	self deny: publishedSomethingElse.