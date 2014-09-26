accessing
version 
	^ self configurationVersion 
		ifEmpty: [ #stable ]