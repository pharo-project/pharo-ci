tests
testing: anArray contains: aSymbol
	
	(anArray contains: [ :each | each = aSymbol ])
		ifFalse: [ self addError: aSymbol asString, ' is missing to ', self configuration name ]