protocol
validate
	self changeProvider isNil 	
		ifTrue: [ self addError: 'Source is nil'.
			^ self validationResult  ].
	self configuration isNil
		ifTrue: [ 
			self addError: 'No configuration has been found'.
			^ self validationResult ].
	self testMetacelloToolBox.
	self testStructure.
	self testIsLoadable.
			