private
forkImage
	self updateSession.
	WorldState deferredUIMessages flush.
	Smalltalk backupTo: name.