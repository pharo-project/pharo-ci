acessing
lastComment
	^ self comments detectMax: [ :comment| comment published ]