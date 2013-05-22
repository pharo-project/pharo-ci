activation
activate
	" isn't working for the moment ..."
	self activateHelp
		ifTrue: [ ^ self ].
	
	remotePort := self argumentAt: 1.
	localPort := self argumentAt: 2.
	self initializeCommunication.
	self sendReadyMessage.