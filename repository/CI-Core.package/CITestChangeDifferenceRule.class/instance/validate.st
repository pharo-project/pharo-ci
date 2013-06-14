protocol
validate
	| result |
	
	"this is the new version"
	result := self newImageDo: [ :remote | 
		((remote at: self class name) validateLocally: self change) asLocalObject ].
	^ self addValidationResult: result
	