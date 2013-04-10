image forking
spawnImageNewSessionDo: newSessionBlock  currentSessionDo: currentSessionBlock
	
	self backupNewTemporaryImage
		ifTrue: newSessionBlock 
		ifFalse: currentSessionBlock