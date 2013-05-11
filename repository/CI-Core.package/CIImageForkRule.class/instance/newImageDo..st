image forking
newImageDo: aBlock
	^ self restoreCommunicationPortAfter: [
		self 
			spawnImageNewSessionDo: [
				self publishResult: 	aBlock.
				self inform: 'B: Terminating'.
				Smalltalk snapshot: true andQuit: true.
				Error signal: 'should not reopen forked validation image' ]
			currentSessionDo: [ ^ self runNewImage ]].