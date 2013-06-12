protocol
validate
	| result |
	
	self assertHasChange.

	"result := self newImageDo: [(self validateChangeBlock: [ (self change)  load ]) asLocalObject ].
	"
	
	1halt.
	"this is the new version"
	result := self newImageDo: [ :remote | (remote at: #CITestChangeDifferenceRule) validateLocally: self change ].
	^ self addValidationResult: result
	