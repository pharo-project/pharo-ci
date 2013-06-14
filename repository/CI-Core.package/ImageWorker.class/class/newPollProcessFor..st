image-evaluation
newPollProcessFor: worker
	"process is usefull to prevent a timeout from Seamless, just in case of."
	
	| process |
	
	process := [ 
		[ VTermOutputDriver stderr green: '.'.
			10 seconds wait.	
			"send a message over the wire"
			(worker remote at: #DateAndTime) now
		] repeat.
		Processor terminateActive ] forkNamed: 'Seamless Poll Process'.
		
	^ process