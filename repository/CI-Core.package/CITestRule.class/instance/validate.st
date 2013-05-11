protocol
validate
	self assertHasChange.
	^ self block ifNotNil: [ 
		self addValidationResult: (self block cull: self change) ]