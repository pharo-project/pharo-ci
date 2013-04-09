setup
setUp
	
	issueChecker := CIChecker pharo.
	
	"Fogbugz does not work anonymously"
	self authenticateTracker