image forking
newImageDo: aBlock
	self 
		spawnImageNewSessionDo: [
			self publishResult: 	aBlock.
			Smalltalk snapshot: true andQuit: true.
			Error signal: 'should not reopen forked validation image' ]
		currentSessionDo: [ ^ self runNewImage ].		