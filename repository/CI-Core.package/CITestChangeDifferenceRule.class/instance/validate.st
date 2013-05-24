protocol
validate
	| result |
	
	self assertHasChange.

	result := ImageWorker evaluate: [ 
		self validateChangeBlock: [ self change load ]].
	
	^ self addValidationResult: result