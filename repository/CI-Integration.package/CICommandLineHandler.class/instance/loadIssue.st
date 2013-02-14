action
loadIssue
	| changeLoader |
	self inform: 'Loading  issue '.
	
	changeLoader := issue changeLoader.
	tracker isAuthenticated 
		ifFalse: [ changeLoader quiet ].
		
	changeLoader load.
	
	Smalltalk snapshot: true andQuit: true.