action-test
loadAndTestIssue
	| changeLoader |
	changeLoader := issue changeLoader.
	tracker isAuthenticated 
		ifFalse: [ changeLoader quiet ].
	changeLoader loadAndTest.

	changeLoader isGreen
		ifFalse: [ self handleIssueTestFailure ]
		ifTrue: [ self handleIssueTestSuccess ].