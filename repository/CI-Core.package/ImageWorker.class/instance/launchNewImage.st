image-forking
launchNewImage
	self isForkedImage 
		ifFalse: [
			forkedImageProcess := OSProcess command: 
				Smalltalk vm command, 
				' ', 
				self temporaryImageFile fullName, 
				' seamless ', 
				self remotePort asString ]
	
	"
	it will not be a forked image since we have seamless comm Unmatched string quote ->andline handlers
	PipeableOSProcess command: temporaryImageCommand.
	self waitingForkedImageMessage."