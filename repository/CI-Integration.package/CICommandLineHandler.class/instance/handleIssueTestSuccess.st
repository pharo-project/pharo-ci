action-test
handleIssueTestSuccess
	self stderr green: 'Issue ', issue id asString, ' is ready for integration'.
	self exitSuccess 