result handling forked image
serializeGlobals: globals result: result
	| serializer stream  ack |
	
	stream := self newWriteSocketStream. 
	self inform: 'B: Waiting for READY'.
	ack :=  (stream next: 5) asString.
	self assert: ack = 'READY' description: 'Expected READY but got ', ack printString.
	self inform: 'B: Writing ACK'.
	stream nextPutAll: 'ACK'; flush.
	
	self inform: 'B: Writing result '.
	serializer := FLSerializer newDefault.
	serializer analyzer considerInternalAllBehaviors: globals.
	[ 
		serializer
			serialize: { globals. result }
			on: stream.
		stream flush.
	
		serializer 
			serialize: { globals. result }
			toFileNamed: DateAndTime now asString, '.fuel'.
		
	] on: Error do: [ :error|
		self inform: 'B: got error during serialization: ', error printString ].
	self inform: 'B: Waiting for OK'.
	
	stream next: 2.
	self inform: 'B: Got OK'.