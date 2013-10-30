*CI-Core
= other
	self class = other class
		ifFalse: [ ^ false ].
	^ result = other result