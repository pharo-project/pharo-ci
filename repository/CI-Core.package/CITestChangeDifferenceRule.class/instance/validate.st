protocol
validate
	| result |
	
	result := self newImageDo: [ 
		self validateChangeBlock: [ self change load ]].
	
	^ self addValidationResult: result