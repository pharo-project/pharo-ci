action-list
listOpenIssues

	self issueChecker openIssues do: [ :openIssue |
		self printOpenIssue: openIssue ].

	self exitSuccess.