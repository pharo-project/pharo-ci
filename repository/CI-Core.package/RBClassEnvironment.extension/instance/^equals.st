*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	self classes = other classes
		ifFalse: [ ^ false ].
	^ self metaClasses = other metaClasses