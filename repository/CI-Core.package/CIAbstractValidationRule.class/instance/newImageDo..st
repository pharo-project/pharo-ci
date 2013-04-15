image forking
newImageDo: aBlock
	self 
		spawnImageNewSessionDo: [
			self publishResult: 	aBlock.
			Smalltalk saveAndQuit.
			Error signal: 'should not reopen forked validation image' ]
		currentSessionDo: [ ^ self runNewImage ].		