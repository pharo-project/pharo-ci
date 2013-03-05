identifying
testRetrieveIdentifyingTokenFormServer
	| client |
	
	client := FogBugzTracker email: 'test@test.com' password: 'testtest'.
	self assert: client identifyingToken size equals: 30