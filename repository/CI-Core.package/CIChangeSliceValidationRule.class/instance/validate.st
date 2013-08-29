protocol
validate

	self addValidationResult: ( self newImageDo: [ :remote |
		((remote at: self class name) validateLocally: self) asLocalObject ]).