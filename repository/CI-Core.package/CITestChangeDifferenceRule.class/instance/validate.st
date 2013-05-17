protocol
validate
	| result |
	
	self assertHasChange.

	result := self imageForker forkDo: [ 
		self validateChangeBlock: [ self change load ]].
	
	^ self addValidationResult: result