action-test
waitForIssueTestTimeout
	| timeout |
	timeout := 30 minutes asDelay.
	[ 
		timeout wait.
		self handleIssueTestTimeout.
	] fork.