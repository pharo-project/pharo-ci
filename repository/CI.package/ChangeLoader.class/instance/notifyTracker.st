accessing
notifyTracker
	self isVerbose ifFalse: [ ^ self ].
	
	self isGreen
		ifTrue: [ self issue fixToInclude: self buildGreenReport ]
		ifFalse:[ self issue reviewNeeded: self buildRedReport ]