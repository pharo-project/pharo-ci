accessing
temporaryChangesFile
	"return the FileReference to the newly created test image "
	^ Smalltalk fileForChangesNamed: self forkedImageName 