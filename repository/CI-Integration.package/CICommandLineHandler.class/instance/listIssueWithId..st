action-list
listIssueWithId: anId
	
	issue := self issueChecker issueWithId: anId.
	self printOpenIssue: issue.

	self exitSuccess.