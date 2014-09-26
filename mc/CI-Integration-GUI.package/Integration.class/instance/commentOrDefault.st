accessing
commentOrDefault 
	self comment isEmptyOrNil 
		ifTrue: [ ^ self generateCommentFromSlices ].
		
	^ self comment
		