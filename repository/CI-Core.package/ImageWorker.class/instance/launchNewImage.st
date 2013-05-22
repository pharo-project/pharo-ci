image-forking
launchNewImage
	
	| temporaryImageCommand |
	temporaryImageCommand := Smalltalk vm command, ' ', self temporaryImageFile fullName.
	PipeableOSProcess command: temporaryImageCommand.
	self waitingForkedImageMessage.