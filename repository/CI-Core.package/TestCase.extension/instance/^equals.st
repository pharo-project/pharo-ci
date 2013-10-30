*CI-Core
= other
	self class = other class
		ifFalse: [ ^ false ].
	^ testSelector = other selector