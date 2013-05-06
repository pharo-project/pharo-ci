setup
setUpSlice

	manager := CIChangeManager pharo.
	"Fogbugz does not work anonymously"
	self authenticateTracker .