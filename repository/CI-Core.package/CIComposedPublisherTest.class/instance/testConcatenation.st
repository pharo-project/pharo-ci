tests
testConcatenation
	| publisherA publisherB composedPublisher |
	
	publisherA := CICommandLinePublisher new.
	publisherB := CIFilePublisher new.
	composedPublisher := publisherA, publisherB.
	
	self assert: composedPublisher publishers size equals: 2.	
		
	self assert: composedPublisher publishers first equals: publisherA.
	self assert: composedPublisher publishers second equals: publisherB.