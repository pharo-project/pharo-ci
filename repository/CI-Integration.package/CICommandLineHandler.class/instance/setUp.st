setup
setUp
	
	issueChecker := IssueChecker pharoFogBugz.
	
	"Fogbugz does not work anonymously"
	self authenticateTracker