protocol
validate
	| result |
	
	self assertHasChange.

	result := "ImageWorker evaluate:" CIImageForker newImageDo: [ 
		self validateChangeBlock: [ self change load ]].
	
	^ self addValidationResult: result