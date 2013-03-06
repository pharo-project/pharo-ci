identifying
testRetrieveIdentifyingTokenFormServer
	| client |
	
	client := FogBugzAPI email: 'test@test.com' password: 'testtest'.
	self assert: client identifyingToken size equals: 30