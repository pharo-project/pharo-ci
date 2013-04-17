setup
setUpSlice
	self stderr green: 'it will be load slices'; lf .
	issueChecker := CIChangeManager pharo.
	"Fogbugz does not work anonymously"
	self authenticateTracker .