image forking
runNewImage
	| forkedImage result |
	
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.
	
	[ 10 milliSeconds wait.  
	forkedImage isComplete ] whileFalse.

	forkedImage succeeded 
		ifFalse: [ 
			^ self addError: self name, ' failed: test image was terminated with signal ', forkedImage processProxy exitStatus asString ].
	
	result := self readResultFromForkedImage: forkedImage.
	self deleteTemporaryImage.
	
	errors addAll: result failures.
	warnings addAll: result warnings.
	messages addAll: result messages.