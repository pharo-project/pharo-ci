image forking
readResultFromForkedImage: forkedImage
	| result |
	
	self inform: 'Waiting for test image results...'.
	
	^ [ 
		result := (FLMaterializer newDefault materializeFrom: self tempFile readStream binary) root.
		"fuel bug prevents us from serializing all values directly, need to handle the globals first"
		result second. ]
	on: Error do: [ :error|
		CIValidationResult failure: 'Could not parse result from forked image' ].
	