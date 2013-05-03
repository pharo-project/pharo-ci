protocol
validate
	^ self block ifNotNil: [ 
		self validationResult: (self block cull: self change) ]