result handling main image
readResultFromForkedImage: forkedImage
	| result stream ack |
	
	self inform: 'Waiting for test image results...'.
	^ [ 
		stream := self newReadSocketStream.
		stream nextPutAll: 'READY'; flush.
		self assert: (ack := stream next: 3) asString = 'ACK'.
		[ result := (FLMaterializer newDefault materializeFrom: stream) root.
		"fuel bug prevents us from serializing all values directly, need to handle the globals first"
		result second.] ensure: [ stream nextPutAll: 'OK'; flush ] ]
	on: Error do: [ :error|
		1halt.
		CIValidationResult failure: 'Could not parse result from forked image' ].
	