printing
printSetupDescriptionOn: aStream
	
	aStream << '----------------------------------------------------------'; lf.
	aStream << 'Tested using ' << SystemVersion current imageVersionString.
	aStream << ' on ' << Smalltalk vm version