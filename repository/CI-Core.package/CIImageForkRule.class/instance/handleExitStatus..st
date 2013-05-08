result handling main image
handleExitStatus: forkedImageProces
	
	forkedImageProces succeeded ifTrue: [ ^ self ].
	
	self addError: self name , ' failed: test image was terminated with signal ' , forkedImageProces processProxy exitStatus asString