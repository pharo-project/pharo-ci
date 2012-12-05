action-test
loadAndTestIssue
	| changeLoader |
	self inform: 'Loading and Testing issue in separate image...'.
	changeLoader := issue changeLoader.
	tracker isAuthenticated 
		ifFalse: [ changeLoader quiet ].
	changeLoader loadAndTest.

	changeLoader isGreen
		ifFalse: [ self handleIssueTestFailure ]
		ifTrue: [ self handleIssueTestSuccess ].