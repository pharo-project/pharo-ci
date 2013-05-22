image-creation
createNewImageName
	self forkedImageName: (Smalltalk imageFile nextVersion basenameWithoutExtension, '_fork').
	session := Smalltalk session
	Smalltalk backupTo: self forkedImageName.
	self checkFileCreation