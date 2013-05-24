initialize-release
initialize

	self localPort: self randomPort.
	VTermOutputDriver stderr red: '<= ', self localPort asString;lf .
	
	self remotePort: self randomPort.
	VTermOutputDriver stderr red: '=> ', self remotePort asString;lf.
	
	self createForkedImage.
	VTermOutputDriver stderr red: self forkedImageName asString;lf.
	
	self isForkedImage 
		ifFalse: [ self initializeCommunication ].			
	