image-forking
launchNewImage
	self isForkedImage 
		ifTrue: [ 
			self inform: 'daddy fork'.
			OSProcess command: 
				Smalltalk vm command, 
				' ', 
				self temporaryImageFile fullName, 
				' seamless ', 
				self remotePort asString. ]
		ifFalse: [ self inform: 'son fork' ]
	
	"
	it will not be a forked image since we have seamless comm Unmatched string quote ->andline handlers
	PipeableOSProcess command: temporaryImageCommand.
	self waitingForkedImageMessage."