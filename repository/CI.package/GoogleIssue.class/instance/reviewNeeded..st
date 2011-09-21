integration
reviewNeeded: aMessageString
	"set the status of the issue to FixToInclude"
	self status: #ReviewNeeded.
	^ self saveStatusChange: (String streamContents: [ :stream| 
				stream << 'This Issue has been marked for review by Ulysse the Monkey:'; lf; lf.
				stream << aMessageString]).