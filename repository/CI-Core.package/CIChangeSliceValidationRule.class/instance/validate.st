protocol
validate

	self configuration isNil
		ifTrue: [ 
			self addError: 'No configuration has been found'.
			^ self validationResult ].
	self testStructure.
	self testIsLoadable.
			