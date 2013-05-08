image forking
runNewImage
	| relayOutput forkedImage |
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.
	relayOutput := self createStderrForwarderForProcess: forkedImage.
	
	[ self handleResultFromForkedImage: forkedImage ]
		ensure: [ 
		self handleExitStatus: forkedImage.
			relayOutput terminate.
			self deleteTemporaryImage ]