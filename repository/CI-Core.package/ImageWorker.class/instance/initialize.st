initialize-release
initialize

	self localPort: 10800.
	self remotePort: 10801.
	self createForkedImage.
	self initializeCommunication.