image-creation
createForkedImage
	self createNewImageName.
	self isForkedImage
		ifTrue: [ self terminateActiveProcess ]
		ifFalse: [ self launchNewImage ]