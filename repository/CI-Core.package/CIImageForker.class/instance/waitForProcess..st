result handling main image
waitForProcess: forkedImage
	[ 10 milliSeconds wait.
	forkedImage isComplete ] whileFalse