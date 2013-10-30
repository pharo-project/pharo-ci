*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	^ andedEnvironment = other andedEnvironment