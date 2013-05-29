image-communication
close
	self isForkedImage
		ifFalse: [ 
			[self closeRemoveImage] fork.
			2 seconds wait.
			self 
				removeForkedImageFiles;
				closeCommunication]