setup
setUp
	Author fullName: 'MonkeyGalactikalIntegrator'.
	
	tracker := GoogleIssueTracker pharo.
	
	(self hasOption: 'update-issue')
		ifTrue: [	self authenticateTracker ].