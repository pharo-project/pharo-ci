action-list
listIssueWithId: anId
	
	issue := self issueChecker changeWithId: anId.
	self printOpenIssue: issue.

	self exitSuccess.