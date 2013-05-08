result handling forked image
serializeGlobals: globals result: result
	| serializer stream  ack |
	stream := self newWriteSocketStream. 
	"wait until we get a READY signal"
	ack :=  (stream next: 5) asString.
	self assert: ack = 'READY'.
	stream nextPutAll: 'ACK'.
	
	serializer := FLSerializer newDefault.
	serializer analyzer considerInternalAllBehaviors: globals.
	serializer
		serialize: { globals. result }
		on: stream.
	"wait until we get an OK response"
	stream next: 2