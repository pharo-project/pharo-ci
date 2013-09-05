protocol
validate
	| result |
	self assertHasChange.
	"Validate this rule in a separate image"
	result := self newImageDo: [ 
		self 
			validateChangeBlock: [ self change load ];
			validationResult ].
	^ self addValidationResult: result
	