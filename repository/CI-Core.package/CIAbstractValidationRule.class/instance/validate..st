validation
validate: aChange
	self change: aChange.
	self inform: 'Running ', self asString.
	[ Author useAuthor: 'CI Validation User' during: [ self validate ]] 
		valueWithin: self timeout 
		onTimeout: [ self timeoutFailure ].
	
	^ self validationResult