action-test
handleIssueTestSuccess
	self stderr green: 'Issue ', change id asString, ' is ready for integration'.
	self exitSuccess 