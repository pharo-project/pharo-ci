private
validate
	self 
		assert: self isValidPlatform
		description: 'You need to use Linux or Mac to make integrations'.
	self 
		assert: self issues isEmptyOrNil not 
		description: 'You need to pick least one issue!'
	