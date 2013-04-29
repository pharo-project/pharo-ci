setup
setUpSlice
	issueChecker := CIChangeManager pharo.
	"Fogbugz does not work anonymously"
	self authenticateTracker .