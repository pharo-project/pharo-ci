tests identifying
testGetListOfReviewNeededIssues
	| client issues |
	
	client := FogBugzTracker pharo logOnWithEmail: 'test@test.com' password: 'testtest'.
	issues := client getAllReviewNeededIssues.
	self assert: (issues allSatisfy: [:e | e isKindOf: FogBugzCase ])