result handling main image
readResultFromForkedImage: forkedImage
	| result communicationStream ack |
	
	self inform: 'Waiting for test image results...'.
	^ [ 
		communicationStream := self newReadSocketStream.
		communicationStream nextPutAll: 'READY'; flush.
		self assert: (ack := communicationStream next: 3) asString = 'ACK'.
		[ 
			result := (FLMaterializer newDefault materializeFrom: communicationStream) root.
			"fuel bug prevents us from serializing all values directly, need to handle the globals first"
			result second
		] ensure: [ communicationStream nextPutAll: 'OK'; flush ]]
	on: Error do: [ :error|
		CIValidationResult failure: (String streamContents: [ :stream|
			stream << 'Could not parse result from forked image: '; print: error.
			error signalerContext shortDebugStackOn: stream ])].
	