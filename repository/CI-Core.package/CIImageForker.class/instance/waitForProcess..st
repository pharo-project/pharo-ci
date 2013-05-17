image forking
waitForProcess: forkedImage
	[ 10 milliSeconds wait.
	forkedImage isComplete ] whileFalse