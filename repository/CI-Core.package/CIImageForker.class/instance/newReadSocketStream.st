result handling main image
newReadSocketStream
	^ (SocketStream on: readSocket) 
		timeout: 10;
		binary;
		yourself