*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	class = other targetClass
		ifFalse: [ ^ false ].
	^ protocols = other protocols