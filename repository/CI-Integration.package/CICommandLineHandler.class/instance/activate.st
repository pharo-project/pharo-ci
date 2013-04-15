activation
activate
	self activateHelp
		ifTrue: [ ^ self ].
	self setUp.
	[ self dispatchSubCommand ]
		on: ChangeNotFound do: [ :error|
			^ Exit signalFailure: 'No loadable changes found' ]