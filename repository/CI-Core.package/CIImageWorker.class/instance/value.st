action
value
	self forkImage.
	
	^ self isForkedImage
		ifTrue: [ self evaluateBlock ]
		ifFalse: [ self runForkedImage ]