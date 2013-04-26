image forking
readResultFromForkedImage: forkedImage
	| result |
	
	self inform: 'Waiting for test image results...'.
	
	[ result := (FLMaterializer newDefault materializeFrom: self tempFile readStream) root ]
		on: Error do: [ :error| 
			^ CIValidationResult failure: 'Could not parse result from forked image' ].
	
	"fuel bug prevents us from serializing all values directly, need to handle the globals first"
	^ result second.