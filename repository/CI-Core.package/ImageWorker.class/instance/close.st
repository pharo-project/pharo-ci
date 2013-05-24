image-communication
close
	self isForkedImage
		ifFalse: [ 
			[self closeRemoveImage] fork.
			2000 milliSeconds wait.
			self 
				removeForkedImageFiles;
				closeCommunication]