result handling forked image
newWriteSocketStream
	"create a new socket stream to communicate back to the main image"
	^ (SocketStream openConnectionToHost: #[ 127 0 0 1] port: self communicationPort) 
		binary