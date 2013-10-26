instance creation
changeProvider: aChangeProvider validator: aCIValidator
	
	^ self new
		changeProvider: aChangeProvider;
		validator: aCIValidator;
		publisher: aChangeProvider publisher;
		yourself