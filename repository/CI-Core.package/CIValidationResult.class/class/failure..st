instance creation
failure: aMessage
	^ self new
		addError: aMessage;
		yourself