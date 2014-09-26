activation
setUpFileTree

	manager := CIChangeManager new
		changeProvider: CIFileTreeChangeProvider new;
		validator: (CIValidator filetree: (self argumentAt: 2));
		publisher: CICommandLinePublisher new;
		yourself.
		
	issue := manager changeWithId: (self argumentAt: 2)