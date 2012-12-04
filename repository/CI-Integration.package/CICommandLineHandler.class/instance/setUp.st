setup
setUp
	tracker := GoogleIssueTracker pharo.
	(self hasOption: 'updateIssue')
		ifTrue: [	self authenticateTracker ].