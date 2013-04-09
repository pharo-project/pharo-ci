setup
setUp
	
	issueChecker := IssueChecker pharo.
	
	"Fogbugz does not work anonymously"
	self authenticateTracker