action-test
handleIssueTestTimeout
	"invoked when the test image doesn't finish timely."
	| message |
	message := 'Timeout occured while loading and testing the code'.
	self issueChecker isAuthenticated 
		ifTrue: [ issue reviewNeeded: message ].
	self exitFailure: message.