activation
dispatchSubCommand
	| subCommand |
	subCommand := self argumentAt: 1.
	
	subCommand= 'issues'
		ifTrue: [ ^ self listOpenIssues ].
	
	self fetchIssue.
	subCommand = 'load'
		ifTrue: [ ^ self loadIssue ].
		
	self testIssue.