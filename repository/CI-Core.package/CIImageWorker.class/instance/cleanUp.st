private - cleanup
cleanUp
	forkedImageProcess isComplete
		ifFalse: [  forkedImageProcess terminate ].
	(name asFileReference, Smalltalk image imageSuffix) ensureDelete.
	(name asFileReference, Smalltalk image changesSuffix) ensureDelete.
	self resultFile ensureDelete.