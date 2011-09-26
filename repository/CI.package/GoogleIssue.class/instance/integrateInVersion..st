integration
integrateInVersion: anInteger
	"set the status of the issue to ReviewNeeded and post a message"
	
	self status: #Closed.
	^ self saveStatusChange: (String streamContents: [ :stream| 
				stream << 'In ' << anInteger printString; lf; lf.
				stream << 'IT IS FOR TEST!! MONKEY IS NOT READY YET']).