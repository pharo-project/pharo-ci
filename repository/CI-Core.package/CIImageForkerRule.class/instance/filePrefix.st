as yet unclassified
filePrefix
	| imageName originalPrefix |
	
	"you have to check if it's not the same, because it will create something wrongs with jenkins while having multiple forked image."
	imageName := Smalltalk imageFile basenameWithoutExtension.
	originalPrefix := super filePrefix.
	
	(originalPrefix = imageName)
		ifFalse: [ ^ originalPrefix ].
		
	^ imageName, '_', originalPrefix