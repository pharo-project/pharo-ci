tests
testPublishIntermediateResult
	| publisher publishedSomethingElse published |
	
	publishedSomethingElse := false.
	published := false.
	publisher := CIPluggablePublisher block: [ publishedSomethingElse := true ].
	publisher intermediateResultBlock: [ published := true ].
	
	publisher publishIntermediateResult: #anObject.
	self assert: published.
	self deny: publishedSomethingElse.