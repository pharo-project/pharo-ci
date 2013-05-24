image-communication
randomPort

| a b |
a := Socket newTCP.
b := (a listenOn: 0) port.
a close.
	^ b