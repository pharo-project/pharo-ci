tests
exampleVersion
	| collection arguments |
	collection := OrderedCollection new.
	collection add: 'config'.
	collection add: 'http://smalltalkhub.com/mc/PharoExtras/Pastell/main'.
	collection add: 'ConfigurationOfPastell'.
	collection add: '--version=1.3'.
	
	arguments := CommandLineArguments withArguments: collection.
	CICommandLineHandler activateWith: arguments