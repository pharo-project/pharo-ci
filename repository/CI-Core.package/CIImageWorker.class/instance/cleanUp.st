private - cleanup
cleanUp
	forkedImageProcess isComplete
		ifFalse: [  forkedImageProcess terminate ].
	
	self forkedImageFile ensureDelete.
	self forkedChangesFile ensureDelete.
	
	self resultFile ensureDelete.