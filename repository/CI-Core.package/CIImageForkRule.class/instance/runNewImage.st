image forking
runNewImage
	| relayOutput forkedImage result |
	
	forkedImage := PipeableOSProcess command: self temporaryImageCommand.

	relayOutput := [[ 
			forkedImage pipeFromError ifNotNil: [ :pipe | 
				[ FileStream stderr nextPutAll: (pipe next: 16); flush ] on:Error do: [ :err | "nothing" ]]
		] repeat ] fork.
 
	[ 10 milliSeconds wait.  
	forkedImage isComplete ] whileFalse.

	relayOutput terminate.

	forkedImage succeeded 
		ifFalse: [ 
			self addError: self name, ' failed: test image was terminated with signal ', forkedImage processProxy exitStatus asString ].
	
	[
		result := self readResultFromForkedImage: forkedImage.
		self addValidationResult:  result.
	] ensure: [ self deleteTemporaryImage ]