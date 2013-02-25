identifying
testGetListOfReviewNeededIssues
	| client issues |
	
	client := FogBugzAPI email: 'test@test.com' password: 'testtest'.
	issues := client getAllReviewNeededIssues.
	self assert: (issues allSatisfy: [:e | e isKindOf: FogBugzIssue ])