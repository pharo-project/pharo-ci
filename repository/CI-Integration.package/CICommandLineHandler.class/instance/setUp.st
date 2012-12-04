setup
setUp
	tracker := GoogleIssueTracker pharo.
	(self hasOption: 'update-issue')
		ifTrue: [	self authenticateTracker ].