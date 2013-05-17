protocol
validate
	| result |
	
	self assertHasChange.

	result := self imageForker newImageDo: [ 
		self validateChangeBlock: [ self change load ]].
	
	^ self addValidationResult: result