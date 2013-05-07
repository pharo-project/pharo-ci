tests
exampleDefault
	| collection arguments  |
	collection := OrderedCollection new.
	collection add: 'config'.
	collection add: 'http://smalltalkhub.com/mc/PharoExtras/Pastell/main'.	
	collection add: 'ConfigurationOfPastell'.
	
	arguments := CommandLineArguments withArguments: collection.
	CICommandLineHandler activateWith: arguments.