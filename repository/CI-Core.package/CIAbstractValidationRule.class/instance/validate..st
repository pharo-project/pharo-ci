validation
validate: aChange
	self change: aChange.
	
	self inform: 'running ', self class name.
	[ self validate ] 
		valueWithin: self timeout 
		onTimeout: [ self timeoutFailure ].
	
	^ self buildValidationResult