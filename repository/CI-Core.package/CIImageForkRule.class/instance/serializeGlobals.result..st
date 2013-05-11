result handling forked image
serializeGlobals: globals result: result
	| serializer stream  ack |
	stream := self newWriteSocketStream. 
	"wait until we get a READY signal"
	self inform: 'B: Waiting for READY'.
	ack :=  (stream next: 5) asString.
	self assert: ack = 'READY' description: 'Expected READY but got ', ack printString.
	self inform: 'B: Writing ACK'.
	stream nextPutAll: 'ACK'.
	
	self inform: 'B: Writing result '.
	serializer := FLSerializer newDefault.
	serializer analyzer considerInternalAllBehaviors: globals.
	serializer
		serialize: { globals. result }
		on: stream.
	self inform: 'B: Waiting for OK'.
	"wait until we get an OK response"
	stream next: 2.
	self inform: 'B: Got OK'.