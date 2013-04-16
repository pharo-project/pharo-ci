image forking
spawnImageNewSessionDo: newSessionBlock  currentSessionDo: currentSessionBlock
	self inform: 'Creating test image'.
	self backupNewTemporaryImage
		ifTrue: newSessionBlock 
		ifFalse: currentSessionBlock