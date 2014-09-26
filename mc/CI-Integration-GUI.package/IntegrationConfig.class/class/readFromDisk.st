reading
readFromDisk
	| file |
	
	file := self fileReference.
	file exists ifFalse: [ ^ nil ].
	^ FLMaterializer materializeFromFileNamed: file fullName