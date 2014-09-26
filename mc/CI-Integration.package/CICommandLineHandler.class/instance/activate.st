activation
activate
	"Hack to prevent delays to be triggered immediatly"
	1 milliSecond wait.

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
		
	((self argumentAt: 1) = 'script')
		ifTrue: [ 
			self setUpScript.
			^ self dispatchSubScriptCommand ].
		
	((self argumentAt: 1) = 'filetree')
		ifTrue: [ 
			self setUpFileTree.
			^ self dispatchSubFileTreeCommand ].
	
	self exitFailure: 'Invalid subcommand: ', (self argumentAt: 1) .