publishing
publishHTMLResult: aCIValidationResult
	self addHtmlStatusLink: aCIValidationResult.
	self htmlPublisher
		publish: aCIValidationResult 
		to: self fileName