protocol
validate
	| result |
	
	"this is the new version"
	result := self newImageDo: [ :remote | (remote at: #CITestChangeDifferenceRule) validateLocally: self change ].
	^ self addValidationResult: result
	