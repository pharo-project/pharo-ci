result handling main image
readResultFromForkedImage: forkedImage
	| result communicationStream ack |
	
	self inform: 'A: Waiting for test image results...'.
	
	communicationStream := self newReadSocketStream.
	self inform: 'A: Writing READY'.
	communicationStream nextPutAll: 'READY'; flush.
	self inform: 'A: Waiting for ACK'.
	self 
		assert: (ack := communicationStream next: 3) asString = 'ACK' 
		description: 'A: Expected ACK but got ', ack printString.
	[ 
		self inform: 'A: Reading result'.
		"fuel bug prevents us from serializing all values directly, need to handle the globals first"
		result := (FLMaterializer newDefault materializeFrom: communicationStream) root second.
		^ result
	] ensure: [ 
		self inform: 'A: Writing OK'.
		communicationStream nextPutAll: 'OK'; flush.
		communicationStream close. ]