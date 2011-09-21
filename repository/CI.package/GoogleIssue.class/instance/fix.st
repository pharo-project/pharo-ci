checking
fix

	^ self hasSlice
		ifTrue: [ self slice ]
		ifFalse:[ self attachements ]