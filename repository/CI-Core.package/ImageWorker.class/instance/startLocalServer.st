image-communication
startLocalServer

	^ localServer := SeamlessDeamon newDefaultWithGlobalAccess startOn: self localPort 