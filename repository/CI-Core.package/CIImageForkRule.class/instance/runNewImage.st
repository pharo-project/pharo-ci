image forking
runNewImage
	| forkedImage result |
	
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.
	self flag: 'add timeout handler here'.
	
	[ 10 milliSeconds wait.  
	forkedImage isComplete] whileFalse.

	forkedImage succeeded 
		ifFalse: [ 
			^ self addError: 'Test failed, image was terminated with signal ', forkedImage processProxy exitStatus asString ].
	result := self readResultFromForkedImage: forkedImage.
	self deleteTemporaryImage.
	errors addAll: result errors.
	warnings addAll: result warnings.
	messages addAll: result messages.