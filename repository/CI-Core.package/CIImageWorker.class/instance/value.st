action
value
	"Evalute the block for this CIImageWorker in a separate image and returns its result"
	self forkImage.
	"This code is run in the forked image (new session) and in the current image (old session)"
	^ self isForkedImage
		ifTrue: [ 
			"In the forked (new session) evaluate the block"
			self evaluateBlock ]
		ifFalse: [ 
			"In the current image (old session) we wait for the forked image to return a result"
			self runForkedImage ]