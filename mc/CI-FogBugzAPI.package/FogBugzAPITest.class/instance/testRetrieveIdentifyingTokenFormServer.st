tests identifying
testRetrieveIdentifyingTokenFormServer
	| client |
	
	client := FogBugzTracker pharo logOnWithEmail: self user password: self password.
	self assert: client identifyingToken size equals: 30