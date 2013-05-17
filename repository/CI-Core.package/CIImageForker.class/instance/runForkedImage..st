result handling forked image
runForkedImage: aBlock
	
	[ self publishResult: aBlock. ] ensure: [ 
		self inform: 'B: Terminating'.
		Smalltalk snapshot: false andQuit: true.
		Error signal: 'should not reopen forked validation image' ]