image-communication
initializeCommunication
	| remoteAuthority |
	remoteAuthority := '127.0.0.1:', self remotePort asString.
	
	10 timesRepeat:[
		2 seconds wait.
		[ 
			self remote: 
				(self startLocalServer connectOn: remoteAuthority).
			VTermOutputDriver stdout 
				green: localServer serverAddress; lf.
		] on: Error do: [ :e |
			VTermOutputDriver stdout 
				red: 'Connection failed: ', e asString; lf. ]].
		
	Error signal: 'Connection to ', remoteAuthority, ' failed'.