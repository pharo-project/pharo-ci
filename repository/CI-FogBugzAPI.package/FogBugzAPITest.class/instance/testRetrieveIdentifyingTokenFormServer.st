tests identifying
testRetrieveIdentifyingTokenFormServer
	| client |
	
	client := FogBugzTracker pharo logOnWithEmail: 'test@test.com' password: 'testtest'.
	self assert: client identifyingToken size equals: 30