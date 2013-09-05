protocol
validate
	| result |
	self assertHasChange.
	"Validate this rule in a separate image"
	result := self newImageDo: [ self remoteValidate ].
	^ self addValidationResult: result
	