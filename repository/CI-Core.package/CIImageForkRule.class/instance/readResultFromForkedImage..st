result handling main image
readResultFromForkedImage: forkedImage
	| result communicationStream ack |
	
	self inform: 'Waiting for test image results...'.
	^ [ 
		communicationStream := self newReadSocketStream.
		self inform: 'A: Writing READY'.
		communicationStream nextPutAll: 'READY'; flush.
		self inform: 'A: Waiting for ACK'.
		self 
			assert: (ack := communicationStream next: 3) asString = 'ACK' 
			description: 'A: Expected ACK but got ', ack printString.
		[ 
			self inform: 'A: Reading result'.
			result := (FLMaterializer newDefault materializeFrom: communicationStream) root.
			"fuel bug prevents us from serializing all values directly, need to handle the globals first"
			result second
		] ensure: [ 
			self inform: 'A: Writing OK'.
			communicationStream nextPutAll: 'OK'; flush ]]
	on: Error do: [ :error|
		CIValidationResult failure: (String streamContents: [ :stream|
			stream << 'Could not parse result from forked image: '; print: error.
			error signalerContext shortDebugStackOn: stream ])].
	