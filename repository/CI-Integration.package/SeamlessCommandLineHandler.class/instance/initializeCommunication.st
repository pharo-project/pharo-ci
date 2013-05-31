image-communication
initializeCommunication
	SeamlessDeamon newDefaultWithGlobalAccess startOn: self localPort.
	5 minutes wait.