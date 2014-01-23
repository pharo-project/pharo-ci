tests
testConcatenationComposedPublisher
	| publisherA publisherB composedPublisher |
	
	publisherA := CICommandLinePublisher, CICommandLinePublisher.
	publisherB := CIFilePublisher new.
	composedPublisher := publisherA, publisherB.
	
	self assert: composedPublisher publishers size equals: 3.	
		
	self assert: (composedPublisher publishers first isKindOf: CICommandLinePublisher).
	self assert: (composedPublisher publishers second isKindOf: CICommandLinePublisher).
	self assert: composedPublisher publishers third equals: publisherB.