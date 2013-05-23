image-creation
createNewImageName
	self forkedImageName: (Smalltalk imageFile nextVersion basenameWithoutExtension, '_fork').
	session := Smalltalk session.
	Smalltalk backupTo: self forkedImageName.
	self isForkedImage
		ifTrue: [ 
			"shut down the current process to avoid side-effects"
			"Processor activeProcess terminate "].
	self checkFileCreation