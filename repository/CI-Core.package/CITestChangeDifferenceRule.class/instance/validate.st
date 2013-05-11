protocol
validate
	| result |
	
	self assertHasChange.

	result := self newImageDo: [ 
		self validateChangeBlock: [ self change load ]].
	
	^ self addValidationResult: result