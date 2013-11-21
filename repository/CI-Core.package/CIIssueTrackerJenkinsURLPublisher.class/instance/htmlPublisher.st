accessing
htmlPublisher
	^ htmlPublisher ifNil: [ htmlPublisher := CIJenkinsHTMLPublisher new ].