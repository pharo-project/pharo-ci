instance creation
error: anError
	^ self basicNew 
		initializeError: anError;
		yourself