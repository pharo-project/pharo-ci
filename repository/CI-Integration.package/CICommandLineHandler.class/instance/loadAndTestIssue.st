action-test
loadAndTestIssue
	| changeLoader |
	changeLoader := issue changeLoader.
	changeLoader loadAndTest.

	changeLoader isGreen
		ifFalse: [ self handleIssueTestFailure ]
		ifTrue: [ self handleIssueTestSuccess ].