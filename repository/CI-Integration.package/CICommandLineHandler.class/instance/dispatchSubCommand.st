activation
dispatchSubCommand
	| subCommand |
	subCommand := self argumentAt: 2.
	
	subCommand= 'list'
		ifTrue: [ ^ self listIssues ].
	
	self fetchIssue.
	subCommand = 'load'
		ifTrue: [ ^ self loadIssue ].
		
	self testIssue.
	self exitSuccess.