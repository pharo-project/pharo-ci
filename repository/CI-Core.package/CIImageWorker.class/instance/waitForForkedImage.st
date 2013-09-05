private
waitForForkedImage
	| delay |
	forkedImageProcess := OSProcess command: self forkedImageCommand.
	delay := 50 milliSeconds asDelay.
	[ forkedImageProcess isComplete ] whileFalse: [ delay wait ].
