action-list
listOpenIssues

	self manager openIssues do: [ :openIssue |
		self printOpenIssue: openIssue ].

	self exitSuccess.