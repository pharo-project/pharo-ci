image-communication
close
	self isForkedImage
		ifTrue: [ ^ self ].
		
	[self closeRemoveImage] fork.
	2 seconds wait.
	self 
		removeForkedImageFiles;
		closeCommunication