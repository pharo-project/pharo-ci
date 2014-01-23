action-list
listIssueWithId: anId
	
	issue := self manager changeWithId: anId.
	self printOpenIssue: issue.

	self exitSuccess.