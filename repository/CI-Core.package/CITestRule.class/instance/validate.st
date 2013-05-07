protocol
validate
	^ self block ifNotNil: [ 
		self addValidationResult: (self block cull: self change) ]