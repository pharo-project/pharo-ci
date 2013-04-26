image forking
readResultFromForkedImage: forkedImage
	| readStream result |
	
	self inform: 'Waiting for test image results...'.
	
	readStream := forkedImage pipeFromOutput upToEnd asByteArray readStream.
	[ result := (FLMaterializer newDefault materializeFrom: readStream) root ]
		on: Error do: [ :error| 
			^ CIValidationResult failure: 'Could not parse result from forked image' ].
	
	"fuel bug prevents us from serializing all values directly, need to handle the globals first"
	^ result second.