image-evaluation
do: aBlock

	| worker process |
	
	worker := self new.
	
	"process is usefull to prevent a timeout from Seamless, just in case of."
	process := [
		[
			VTermOutputDriver stderr green: 'waiting...';lf.
			1 second wait.
			"send a message over the wire"
			(worker remote at: #DateAndTime) now ] repeat.
		Processor terminateActive ] forkNamed: 'Seamless Poll Process'.
		
	[ worker isForkedImage 	
		ifFalse: [ aBlock value: worker ].
	] ensure: [
		process terminate.
		worker close ].