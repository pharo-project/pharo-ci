result handling main image
runNewImage
	| relayOutput forkedImage |
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.
	relayOutput := self createStderrForwarderForProcess: forkedImage.
	
	[ ^ self handleResultFromForkedImage: forkedImage ]
		ensure: [ 
		relayOutput terminate.
		readSocket close.
		self handleExitStatus: forkedImage.
		self deleteTemporaryImage ]