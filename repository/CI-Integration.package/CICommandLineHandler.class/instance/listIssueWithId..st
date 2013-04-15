action-list
listIssueWithId: anId
	
	change := self issueChecker changeWithId: anId.
	self printOpenIssue: change.

	self exitSuccess.