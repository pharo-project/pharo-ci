image-communication
initializeCommunication
	SeamlessDeamon newDefaultWithGlobalAccess startOn: self localPort.
	self halt.