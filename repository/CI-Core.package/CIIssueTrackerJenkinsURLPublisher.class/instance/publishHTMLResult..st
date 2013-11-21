publishing
publishHTMLResult: aCIValidationResult
	self htmlPublisher
		publish: aCIValidationResult 
		to: self fileName