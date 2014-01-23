setup
loadIssue

	self inform: 'Loading  issue '.
	self manager loadCase: issue.
	
	Smalltalk snapshot: true andQuit: true.