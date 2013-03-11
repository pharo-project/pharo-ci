*CI-FogBugzAPI
preventComment

	self labels: (self labels, { 'Restrict-AddIssueComment-Commit' }).
	self submitStatusChange: 'This issue is now locked. Please use FogBugz instead'