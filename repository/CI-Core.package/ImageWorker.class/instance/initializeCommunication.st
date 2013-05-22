image-communication
initializeCommunication
	self remote: 
		(self startLocalServer connectOn: self remotePort ) 