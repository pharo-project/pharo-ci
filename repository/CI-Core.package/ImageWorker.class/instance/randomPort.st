image-communication
randomPort

	| socket port |
	
	socket := Socket newTCP.
	port := (socket listenOn: 0) port.
	socket close.
	
	^ port