initialize-release
initialize

	self localPort: 8080.
	self remotePort: 8081.
	self createForkedImage.