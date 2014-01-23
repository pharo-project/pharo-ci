tests
testPublishChangeNotFound
	| publisher publishedSomethingElse publishedChangeNotFound |
	
	publishedSomethingElse := false.
	publishedChangeNotFound := false.
	publisher := CIPluggablePublisher block: [ publishedSomethingElse := true ].
	publisher changeNotFoundBlock: [ publishedChangeNotFound := true ].
	
	publisher publishChangeNotFound: #anObject.
	self assert: publishedChangeNotFound .
	self deny: publishedSomethingElse.