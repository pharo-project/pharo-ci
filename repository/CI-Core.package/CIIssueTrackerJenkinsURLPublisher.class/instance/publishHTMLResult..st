publishing
publishHTMLResult: aCIValidationResult
	CIJenkinsHTMLPublisher 
		publish: aCIValidationResult 
		to: self fileName