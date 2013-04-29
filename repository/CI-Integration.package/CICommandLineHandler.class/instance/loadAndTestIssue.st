action-test
loadAndTestIssue
	| changeLoader |
	self flag: 'stdout and stderr should be lazily initialized'.
	self initializeStderr; initializeStdout.
	
	changeLoader := issue changeLoader.
	self issueChecker isAuthenticated 
		ifFalse: [ changeLoader quiet ].
	changeLoader loadAndTest.

	changeLoader isGreen
		ifFalse: [ self handleIssueTestFailure ]
		ifTrue: [ self handleIssueTestSuccess ].