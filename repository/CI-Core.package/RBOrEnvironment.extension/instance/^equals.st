*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	^ orEnvironment = other orEnvironment