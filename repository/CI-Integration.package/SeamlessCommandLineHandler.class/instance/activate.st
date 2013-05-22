activation
activate
	" isn't working for the moment ..."
	self activateHelp
		ifTrue: [ ^ self ].
	localPort := self argumentAt: 1.
	self initializeCommunication.