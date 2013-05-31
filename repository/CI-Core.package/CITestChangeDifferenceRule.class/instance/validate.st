protocol
validate
	| result |
	
	self assertHasChange.

	result := self newImageDo: [(self validateChangeBlock: [ (self change)  load ]) asLocalObject ].
	^ self addValidationResult: result
	