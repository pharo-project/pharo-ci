tests
testConcatenationClasses
	| composedPublisher |
	composedPublisher := CICommandLinePublisher, CIFilePublisher.
	
	self assert: composedPublisher publishers size equals: 2.	
		
	self assert: (composedPublisher publishers first isKindOf: CICommandLinePublisher).
	self assert: (composedPublisher publishers second isKindOf: CIFilePublisher).