image-communication
initializeCommunication
	self remote: 
		(self startLocalServer connectOn: '127.0.0.1:', self remotePort asString) 