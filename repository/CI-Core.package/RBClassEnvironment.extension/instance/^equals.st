*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	classes = other classes
		ifFalse: [ ^ false ].
	^ metaClasses = other metaClasses