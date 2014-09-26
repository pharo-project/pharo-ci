system startup
startUp: resuming
	resuming ifFalse: [ ^ self ].
	Smalltalk addDeferredStartupAction: [ Current reset ]