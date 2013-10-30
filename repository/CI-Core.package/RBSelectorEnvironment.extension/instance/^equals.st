*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	classSelectors = other classSelectors
		ifFalse: [ ^ false ].
	^ metaClassSelectors = other metaClassSelectors