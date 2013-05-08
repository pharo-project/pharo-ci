image forking
spawnImageNewSessionDo: newSessionBlock  currentSessionDo: currentSessionBlock
	self openCommunicationSocket.
	self inform: 'Creating test image'.
	self backupNewTemporaryImage
		ifTrue: newSessionBlock 
		ifFalse: currentSessionBlock