integration
failingTest: aMessageString
	"set the status of the issue to WorkNeeded and post a message"
	
	self status: PharoTrackerLabels failingTest.
	
	^ self submitStatusChange: aMessageString.
	