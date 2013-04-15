image forking
runNewImage
	| forkedImage result |	
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.
	result := self readResultFromForkedImage: forkedImage.
	
	[ 10 milliSeconds wait.  
	forkedImage isComplete] whileFalse.

	forkedImage succeeded 
		ifFalse: [ 
			result addFailure: 'Test failed, image was terminated with signal ', forkedImage exitStatus asString ].
	self deleteTemporaryImage.
	^ result