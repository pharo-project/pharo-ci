image forking
deleteTemporaryImage
	(self temporaryImageName asFileReference, Smalltalk imageSuffix) ensureDeleted.
	(self temporaryImageName asFileReference, Smalltalk changesSuffix) ensureDeleted.	