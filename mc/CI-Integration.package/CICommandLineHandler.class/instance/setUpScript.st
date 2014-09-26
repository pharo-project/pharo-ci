activation
setUpScript

	manager := CIChangeManager new
		changeProvider: CIScriptChangeProvider new;
		validator: CIValidator pharo40;
		publisher: CICommandLinePublisher new;
		yourself.
		
	issue := manager changeWithId: (self argumentAt: 2)