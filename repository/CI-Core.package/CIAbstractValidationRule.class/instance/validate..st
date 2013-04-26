validation
validate: aChange
	self change: aChange.
	
	[ self validate ] 
		valueWithin: self timeout 
		onTimeout: [ self timeoutFailure ].
	
	^ self buildValidationResult