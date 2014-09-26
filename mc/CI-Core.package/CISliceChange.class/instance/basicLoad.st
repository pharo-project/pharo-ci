protocol
basicLoad	
	"testing problems in CIChangeSliceValidationRule"
	self case hasPreload 
		ifTrue: [ Smalltalk compiler evaluate: self case preload ].
	self slice merge.
	self case hasPostload 
		ifTrue: [ Smalltalk compiler evaluate: self case postload ].	