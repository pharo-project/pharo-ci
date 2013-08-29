protocol
validate
	| result |
	self assertHasChange.
	"Validate this rule in a separate image"
	result := self newImageDo: [ :remote | 
		((remote at: self class name) validateLocally: self) asLocalObject ].
	^ self addValidationResult: result
	