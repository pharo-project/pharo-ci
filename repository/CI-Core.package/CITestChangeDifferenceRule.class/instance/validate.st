protocol
validate
	| result |
	self assertHasChange.
	"this is the new version"
	result := self newImageDo: [ :remote | 
		((remote at: self class name) validateLocally: self) asLocalObject ].
	^ self addValidationResult: result
	