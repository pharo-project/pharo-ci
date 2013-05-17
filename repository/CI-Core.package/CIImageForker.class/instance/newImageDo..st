image forking
newImageDo: aBlock
	self restoreCommunicationPortAfter: [
		self 
			spawnImageNewSessionDo: [ self runForkedImage: aBlock ]
			currentSessionDo: [ ^ self runNewImage ]].