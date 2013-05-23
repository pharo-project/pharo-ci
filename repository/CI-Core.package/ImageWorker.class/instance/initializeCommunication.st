image-communication
initializeCommunication
	1000 milliSeconds wait.
	self remote: 
		(self startLocalServer connectOn: '127.0.0.1:', self remotePort asString) 