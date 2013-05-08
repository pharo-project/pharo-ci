testing
basicValidate
	Smalltalk allClassesDo:[ :aClass |
		aClass hasComment
			ifFalse: [ self addWarning: aClass ]].
	^ self validationResult