image forking
createStderrForwarderForProcess: forkedImage
	^ [ 
	[ 
	forkedImage pipeFromError
		ifNotNil: [ :pipe | 
			[ 
			FileStream stderr
				nextPutAll: (pipe next: 16);
				flush;flush ]
				on: Error
				do: [ :err | "nothing"] ] ] repeat ] fork