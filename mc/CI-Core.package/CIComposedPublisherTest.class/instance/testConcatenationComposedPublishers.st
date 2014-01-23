tests
testConcatenationComposedPublishers
	| publisherA publisherB composedPublisher |
	
	publisherA := CICommandLinePublisher, CICommandLinePublisher.
	publisherB := CIFilePublisher, CIFilePublisher.
	composedPublisher := publisherA, publisherB.
	
	self assert: composedPublisher publishers size equals: 4.	
		
	self assert: (composedPublisher publishers first isKindOf: CICommandLinePublisher).
	self assert: (composedPublisher publishers second isKindOf: CICommandLinePublisher).
	self assert: (composedPublisher publishers third isKindOf: CIFilePublisher).
	self assert: (composedPublisher publishers fourth isKindOf: CIFilePublisher).