action-list
listOpenIssues
	tracker openIssues do: [ :openIssue |
		self printOpenIssue: openIssue ].
	self exitSuccess.