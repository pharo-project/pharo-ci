activation
activate
	| subCommand |
	self activateHelp
		ifTrue: [ ^ self ].
	subCommand := self argumentAt: 1.
	subCommand= 'config'
		ifTrue: [ 
			self setUpConfiguration.
			self testConfiguration inspect.
			^ self exitSuccess ].
	subCommand= 'slice'
		ifTrue: [ 
			self setUpSlice.
			^ self dispatchSubCommand ].
	self exitFailure: 'Invalid subcommand: ', subCommand.