image forking
backupNewTemporaryImage
	self deleteTemporaryImage.
	^ Smalltalk backupTo: self temporaryImageName