as yet unclassified
filePrefix
	| imageName originalPrefix |
	
	imageName := Smalltalk imageFile basenameWithoutExtension.
	originalPrefix := super filePrefix.
	
	(originalPrefix = imageName)
		ifFalse: [ ^ originalPrefix ].
		
	^ imageName, '_', originalPrefix