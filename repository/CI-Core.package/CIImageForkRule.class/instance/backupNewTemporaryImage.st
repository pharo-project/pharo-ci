image forking
backupNewTemporaryImage
	| oldImageName newImageName |
	self deleteTemporaryImage.
	newImageName := self temporaryImageName.
	oldImageName := Smalltalk shortImageName.
	^ Smalltalk backupTo: newImageName