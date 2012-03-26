acessing
commentById: anObject
	^ self comments detect: [ :comment| comment id = anObject ]