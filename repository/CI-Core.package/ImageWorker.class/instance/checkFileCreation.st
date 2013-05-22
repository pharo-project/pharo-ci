assertion
checkFileCreation
	
	self 
		assert: self temporaryChangesFile exists  
		description: self temporaryChangesFile basename, ' doesn''t exist'.
	self 
		assert: self temporaryImageFile exists 
		description: self temporaryImageFile basename, ' doesn''t exist'.