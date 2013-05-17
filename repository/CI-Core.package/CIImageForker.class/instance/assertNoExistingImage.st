image forking
assertNoExistingImage
	
	self 
		assert: self temporaryChangesFile exists not 
		description: self temporaryChangesFile basename, ' exists already'..
	self 
		assert: self temporaryImageFile exists not
		description: self temporaryImageFile basename, ' exists already'.