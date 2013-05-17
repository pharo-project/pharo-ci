result handling main image
handleExitStatus: forkedImageProces
	self waitForProcess: forkedImageProces.
	forkedImageProces succeeded
		ifTrue: [ ^ self ].
	self inform: ' failed: test image was terminated with signal ' , forkedImageProces processProxy exitStatus asString