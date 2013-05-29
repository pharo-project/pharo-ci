protocol
validate
	| result |
	
	self assertHasChange.

	result := self validateChangeBlock: [ self change load ].
	
	^ self addValidationResult: result