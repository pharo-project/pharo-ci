activation
dispatchSubConfigurationCommand

	"((self argumentAt: 2) = 'listGroup')
		ifTrue: [ ^ self listGroup ].
		
	((self argumentAt: 2) = 'version')
		ifTrue: [ ^ self listVersion ]."
	self testConfiguration.
	self exitSuccess.