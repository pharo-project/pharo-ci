action
loadIssue
	self inform: 'Loading  issue '.
	
	self issueChecker loadCase: issue.
	
	Smalltalk snapshot: true andQuit: true.