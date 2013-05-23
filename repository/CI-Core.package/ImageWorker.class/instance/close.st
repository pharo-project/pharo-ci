image-communication
close
	self isForkedImage
		ifFalse: [ 
			self
				closeRemoveImage;
				removeForkedImageFiles;
				closeCommunication ]