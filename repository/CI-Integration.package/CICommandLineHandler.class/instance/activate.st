activation
activate
	| subCommand |
	self activateHelp
		ifTrue: [ ^ self ].
	subCommand := self argumentAt: 1.
	subCommand= 'config'
		ifTrue: [ 
			self setUpConfig.
			self testConfig inspect].
	subCommand= 'slice'
		ifTrue: [ 
			self setUpSlice.
			self dispatchSubCommand.].