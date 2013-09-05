accessing
forkedImageCommand
	^ Smalltalk vm command, ' "', self forkedImageFile fullName, '" --no-quit'