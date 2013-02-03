activation
activate
	self activateHelp
		ifTrue: [ ^ self ].
	self setUp.
	self dispatchSubCommand.