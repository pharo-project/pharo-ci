activation
dispatchSubCommand
	| subCommand |
	subCommand := self argumentAt: 1.
	
	subCommand= 'list'
		ifTrue: [ ^ self listIssues ].
	
	self fetchIssue.
	subCommand = 'load'
		ifTrue: [ ^ self loadIssue ].
		
	self testIssue.