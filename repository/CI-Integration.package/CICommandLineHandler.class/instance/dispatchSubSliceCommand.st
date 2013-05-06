activation
dispatchSubSliceCommand

	(self argumentAt: 2) = 'list'
		ifTrue: [ ^ self listIssues ].
		
	self fetchIssue.
	(self argumentAt: 2) = 'load'
		ifTrue: [ ^ self loadIssue ].

	self testIssue.
	self exitSuccess.
