image-creation
createNewImageName
	self forkedImageName: (Smalltalk imageFile nextVersion basenameWithoutExtension, '_fork', DateAndTime now asString).
	session := Smalltalk session.
	Smalltalk backupTo: self forkedImageName.
	self checkFileCreation