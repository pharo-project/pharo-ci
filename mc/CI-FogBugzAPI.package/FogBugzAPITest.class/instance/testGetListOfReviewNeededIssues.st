tests identifying
testGetListOfReviewNeededIssues
	| client issues |
	
	client := FogBugzTracker pharo logOnWithEmail: self user password: self password .
	issues := client getAllReviewNeededIssues.
	self assert: (issues allSatisfy: [:e | e isKindOf: FogBugzCase ])