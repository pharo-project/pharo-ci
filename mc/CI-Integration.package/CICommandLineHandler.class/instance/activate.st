activation
activate

	self activateHelp
		ifTrue: [ ^ self ].
		
	((self argumentAt: 1) = 'config')
		ifTrue: [ 
			self setUpConfiguration.
			^ self dispatchSubConfigurationCommand].
		
	((self argumentAt: 1) = 'slice')
		ifTrue: [ 
			self setUpSlice.
			^ self dispatchSubSliceCommand ].
		
	self exitFailure: 'Invalid subcommand: ', (self argumentAt: 1) .