activation
activate
	" isn't working for the moment ..."
	| originalPort actualPort local remote |
	self activateHelp
		ifTrue: [ ^ self ].
	
	originalPort:= self argumentAt: 1.
	actualPort:= self argumentAt: 2.
	local := SeamlessDeamon newDefaultWithGlobalAccess startOn: actualPort.
	remote := local connectOn: '127.0.0.1:', originalPort. 
	(remote at: #ForkedImage) new; remoteIsReady.