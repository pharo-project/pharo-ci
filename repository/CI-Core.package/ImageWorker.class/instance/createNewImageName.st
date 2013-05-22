image-creation
createNewImageName
	self forkedImageName: (Smalltalk imageFile nextVersion basenameWithoutExtension, '_fork').
	Smalltalk backupTo: self forkedImageName.
	self checkFileCreation