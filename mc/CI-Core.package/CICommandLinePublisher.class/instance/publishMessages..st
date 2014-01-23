publishing
publishMessages: aCIValidationResult 

	self 
		publishList: aCIValidationResult messages
		title: 'Validation Messages:'
		color: Color cyan.