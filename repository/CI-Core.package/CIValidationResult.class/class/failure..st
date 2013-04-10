instance creation
failure: aMessage
	^ self new
		addFailure: aMessage;
		yourself