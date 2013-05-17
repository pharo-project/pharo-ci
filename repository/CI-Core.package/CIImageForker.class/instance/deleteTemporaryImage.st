image forking
deleteTemporaryImage
	self temporaryChangesFile ensureDeleted.
	self temporaryImageFile ensureDeleted.	