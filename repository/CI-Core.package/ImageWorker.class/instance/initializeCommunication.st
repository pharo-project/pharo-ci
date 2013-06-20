image-communication
initializeCommunication
	| remoteAuthority |
	remoteAuthority := '127.0.0.1:', self remotePort asString.
	
	100 timesRepeat:[
		0.2 seconds wait.
		[ 
			self remote: 
				(self startLocalServer connectOn: remoteAuthority).
			VTermOutputDriver stdout 
				green: localServer serverAddress; lf.
			^ self.
		] on: Error do: [ :e | ]].
		
	Error signal: 'Connection to ', remoteAuthority, ' failed'.