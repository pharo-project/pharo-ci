image forking
backupNewTemporaryImage
	| oldImageName newImageName |
	self assertNoExistingImage.
	
	newImageName := self temporaryImageName.
	oldImageName := Smalltalk shortImageName.
	^ Smalltalk backupTo: newImageName