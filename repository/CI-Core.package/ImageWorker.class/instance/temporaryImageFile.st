accessing
temporaryImageFile
	"return the FileReference to the newly created test image "
	^ Smalltalk fileForImageNamed: self forkedImageName 