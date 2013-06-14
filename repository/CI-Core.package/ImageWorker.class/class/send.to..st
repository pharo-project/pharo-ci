image-evaluation
send: aSelector to: aClassName

	| worker result process |
	
	worker := self new.
	
	"process is usefull to prevent a timeout from Seamless, just in case of."
	process := [
		[
			VTermOutputDriver stderr green: 'waiting...';lf.
			1 second wait.
			(worker remote at: #DateAndTime) now ] repeat.
		Processor terminateActive ] fork.
		
	worker isForkedImage 	
		ifFalse: [ result := (worker send: aSelector to: aClassName) asLocalObject ].
	
	process terminate.
	worker close.
	^ result