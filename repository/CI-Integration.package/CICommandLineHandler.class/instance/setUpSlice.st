setup
setUpSlice

	manager := CIChangeManager pharo.
	manager publisher: self setUpSlicePublisher.
	"Fogbugz does not work anonymously"
	self authenticateTracker.