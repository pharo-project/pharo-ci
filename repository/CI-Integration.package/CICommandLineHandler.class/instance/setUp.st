setup
setUp
	
	changeManager := CIChangeManager pharo.
	
	"Fogbugz does not work anonymously"
	self authenticateTracker