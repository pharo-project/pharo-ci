private
waitForForkedImage
	| delay |
	self inform: 'Running: ', self forkedImageCommand.
	forkedImageProcess := OSProcess command: self forkedImageCommand.
	delay := 50 milliSeconds asDelay.
	[ forkedImageProcess isComplete ] whileFalse: [ delay wait ].
