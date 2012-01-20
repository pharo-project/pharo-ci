integration
reviewNeeded: aMessageString
	"set the status of the issue to ReviewNeeded and post a message"
	
	self status: #FixReviewNeeded.
	^ self saveStatusChange: aMessageString.
	"^ self saveStatusChange: (String streamContents: [ :stream| 
				stream << 'This Issue has been marked for review by Ulysse the Monkey:'; lf; lf.
				stream << aMessageString])."