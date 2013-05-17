result handling main image
runNewImage
	| relayOutput forkedImage |
	self 
		assert: self temporaryChangesFile exists;
		assert: self temporaryImageFile exists.
	
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.
	relayOutput := self createStderrForwarderForProcess: forkedImage.
	
	[ ^ self handleResultFromForkedImage: forkedImage ]
		ensure: [ 
		relayOutput terminate.
		readSocket ifNotNil: [ readSocket close ].
		self handleExitStatus: forkedImage.
		self deleteTemporaryImage ]