tests
testSetManager
	| composedPublisher manager|
	
	composedPublisher := CIFuelPublisher, CICommandLinePublisher, CIIssueTrackerPublisher.
	manager := CIChangeManager new.
	
	self assert: composedPublisher manager equals: nil.
	
	composedPublisher manager: manager.
	
	self assert: composedPublisher manager equals: manager.
	composedPublisher publishers do: [ :publisher|
		self assert: publisher manager equals: manager ]