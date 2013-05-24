image-communication
initializeCommunication
	2000 milliSeconds wait.
	self remote: 
		(self startLocalServer connectOn: '127.0.0.1:', self remotePort asString).
	VTermOutputDriver stdout 
		green: localServer serverAddress; lf.